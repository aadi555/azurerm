resource "azurerm_api_management_api_operation" "op" {

  resource_group_name = var.context.resource_group_name

  api_name            = var.service_settings.api_name
  api_management_name = var.service_settings.endpoint_name

  operation_id        = var.operation_settings.operation_id
  display_name        = var.operation_settings.display_name
  description         = var.operation_settings.description
  method              = var.operation_settings.method
  url_template        = var.operation_settings.url_template

  response {
    status_code = 200
  }
}

resource "azurerm_api_management_api_operation_policy" "op_policy" {

  resource_group_name = var.context.resource_group_name

  api_name            = var.service_settings.api_name
  api_management_name = var.service_settings.endpoint_name

  operation_id        = azurerm_api_management_api_operation.op.operation_id

  xml_content = <<XML
<policies>
    <inbound>
        <base />
    </inbound>
    <backend>
        <base />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>
XML

}