output "dialogflow_cx_tool_versions_id" {
  description = "Map of id values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no id are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dialogflow_cx_tool_versions_create_time" {
  description = "Map of create_time values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no create_time are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "dialogflow_cx_tool_versions_deletion_policy" {
  description = "Map of deletion_policy values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dialogflow_cx_tool_versions_display_name" {
  description = "Map of display_name values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no display_name are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "dialogflow_cx_tool_versions_name" {
  description = "Map of name values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no name are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dialogflow_cx_tool_versions_parent" {
  description = "Map of parent values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no parent are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "dialogflow_cx_tool_versions_tool" {
  description = "Map of tool values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no tool are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => one(v.tool) if v.tool != null && length(v.tool) > 0 }
  sensitive   = true
}
output "dialogflow_cx_tool_versions_update_time" {
  description = "Map of update_time values across all dialogflow_cx_tool_versions, keyed the same as var.dialogflow_cx_tool_versions except keys with no update_time are omitted"
  value       = { for k, v in google_dialogflow_cx_tool_version.dialogflow_cx_tool_versions : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

