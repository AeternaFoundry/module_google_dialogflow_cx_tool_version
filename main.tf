resource "google_dialogflow_cx_tool_version" "dialogflow_cx_tool_versions" {
  for_each = var.dialogflow_cx_tool_versions

  display_name    = each.value.display_name
  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy

  tool {
    dynamic "data_store_spec" {
      for_each = each.value.tool.data_store_spec != null ? [each.value.tool.data_store_spec] : []
      content {
        dynamic "data_store_connections" {
          for_each = data_store_spec.value.data_store_connections
          content {
            data_store               = data_store_connections.value.data_store
            data_store_type          = data_store_connections.value.data_store_type
            document_processing_mode = data_store_connections.value.document_processing_mode
          }
        }
        fallback_prompt {
        }
      }
    }
    description  = each.value.tool.description
    display_name = each.value.tool.display_name
    dynamic "function_spec" {
      for_each = each.value.tool.function_spec != null ? [each.value.tool.function_spec] : []
      content {
        input_schema  = function_spec.value.input_schema
        output_schema = function_spec.value.output_schema
      }
    }
    dynamic "open_api_spec" {
      for_each = each.value.tool.open_api_spec != null ? [each.value.tool.open_api_spec] : []
      content {
        dynamic "authentication" {
          for_each = open_api_spec.value.authentication != null ? [open_api_spec.value.authentication] : []
          content {
            dynamic "api_key_config" {
              for_each = authentication.value.api_key_config != null ? [authentication.value.api_key_config] : []
              content {
                api_key                    = api_key_config.value.api_key
                key_name                   = api_key_config.value.key_name
                request_location           = api_key_config.value.request_location
                secret_version_for_api_key = api_key_config.value.secret_version_for_api_key
              }
            }
            dynamic "bearer_token_config" {
              for_each = authentication.value.bearer_token_config != null ? [authentication.value.bearer_token_config] : []
              content {
                secret_version_for_token = bearer_token_config.value.secret_version_for_token
                token                    = bearer_token_config.value.token
              }
            }
            dynamic "oauth_config" {
              for_each = authentication.value.oauth_config != null ? [authentication.value.oauth_config] : []
              content {
                client_id                        = oauth_config.value.client_id
                client_secret                    = oauth_config.value.client_secret
                oauth_grant_type                 = oauth_config.value.oauth_grant_type
                scopes                           = oauth_config.value.scopes
                secret_version_for_client_secret = oauth_config.value.secret_version_for_client_secret
                token_endpoint                   = oauth_config.value.token_endpoint
              }
            }
            dynamic "service_agent_auth_config" {
              for_each = authentication.value.service_agent_auth_config != null ? [authentication.value.service_agent_auth_config] : []
              content {
                service_agent_auth = service_agent_auth_config.value.service_agent_auth
              }
            }
          }
        }
        dynamic "service_directory_config" {
          for_each = open_api_spec.value.service_directory_config != null ? [open_api_spec.value.service_directory_config] : []
          content {
            service = service_directory_config.value.service
          }
        }
        text_schema = open_api_spec.value.text_schema
        dynamic "tls_config" {
          for_each = open_api_spec.value.tls_config != null ? [open_api_spec.value.tls_config] : []
          content {
            dynamic "ca_certs" {
              for_each = tls_config.value.ca_certs
              content {
                cert         = ca_certs.value.cert
                display_name = ca_certs.value.display_name
              }
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

