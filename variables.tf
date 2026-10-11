variable "dialogflow_cx_tool_versions" {
  description = <<EOT
Map of dialogflow_cx_tool_versions, attributes below
Required:
    - display_name
    - parent
    - tool (block):
        - data_store_spec (optional, block):
            - data_store_connections (required, block):
                - data_store (optional)
                - data_store_type (optional)
                - document_processing_mode (optional)
            - fallback_prompt (required, block):
        - description (required)
        - display_name (required)
        - function_spec (optional, block):
            - input_schema (optional)
            - output_schema (optional)
        - open_api_spec (optional, block):
            - authentication (optional, block):
                - api_key_config (optional, block):
                    - api_key (optional)
                    - key_name (required)
                    - request_location (required)
                    - secret_version_for_api_key (optional)
                - bearer_token_config (optional, block):
                    - secret_version_for_token (optional)
                    - token (optional)
                - oauth_config (optional, block):
                    - client_id (required)
                    - client_secret (optional)
                    - oauth_grant_type (required)
                    - scopes (optional)
                    - secret_version_for_client_secret (optional)
                    - token_endpoint (required)
                - service_agent_auth_config (optional, block):
                    - service_agent_auth (optional)
            - service_directory_config (optional, block):
                - service (required)
            - text_schema (required)
            - tls_config (optional, block):
                - ca_certs (required, block):
                    - cert (required)
                    - display_name (required)
Optional:
    - deletion_policy
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    display_name    = string
    parent          = string
    deletion_policy = optional(string)
    tool = object({
      data_store_spec = optional(object({
        data_store_connections = list(object({
          data_store               = optional(string)
          data_store_type          = optional(string)
          document_processing_mode = optional(string)
        }))
        fallback_prompt = object({
        })
      }))
      description  = string
      display_name = string
      function_spec = optional(object({
        input_schema  = optional(string)
        output_schema = optional(string)
      }))
      open_api_spec = optional(object({
        authentication = optional(object({
          api_key_config = optional(object({
            api_key                    = optional(string)
            key_name                   = string
            request_location           = string
            secret_version_for_api_key = optional(string)
          }))
          bearer_token_config = optional(object({
            secret_version_for_token = optional(string)
            token                    = optional(string)
          }))
          oauth_config = optional(object({
            client_id                        = string
            client_secret                    = optional(string)
            oauth_grant_type                 = string
            scopes                           = optional(list(string))
            secret_version_for_client_secret = optional(string)
            token_endpoint                   = string
          }))
          service_agent_auth_config = optional(object({
            service_agent_auth = optional(string)
          }))
        }))
        service_directory_config = optional(object({
          service = string
        }))
        text_schema = string
        tls_config = optional(object({
          ca_certs = list(object({
            cert         = string
            display_name = string
          }))
        }))
      }))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_tool_versions : (
        v.tool.data_store_spec == null || (length(v.tool.data_store_spec.data_store_connections) >= 1)
      )
    ])
    error_message = "Each data_store_connections list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_tool_versions : (
        v.tool.open_api_spec == null || (v.tool.open_api_spec.tls_config == null || (length(v.tool.open_api_spec.tls_config.ca_certs) >= 1))
      )
    ])
    error_message = "Each ca_certs list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_tool_versions : (
        v.tool.function_spec == null || (v.tool.function_spec.input_schema == null || (can(jsondecode(v.tool.function_spec.input_schema))))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.dialogflow_cx_tool_versions : (
        v.tool.function_spec == null || (v.tool.function_spec.output_schema == null || (can(jsondecode(v.tool.function_spec.output_schema))))
      )
    ])
    error_message = "must be valid JSON"
  }
}

