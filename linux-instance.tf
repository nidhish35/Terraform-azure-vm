resource "azurerm_network_interface" "terra-demo" {
  name                = "terra-demo-nic"
  location            = azurerm_resource_group.terra-demo.location
  resource_group_name = azurerm_resource_group.terra-demo.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.terra-demo.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.terra-demo.id
  }
}

# resource "azurerm_linux_virtual_machine" "terra-demo" {
#   name                = "terra-demo-machine01"
#   resource_group_name = azurerm_resource_group.terra-demo.name
#   location            = azurerm_resource_group.terra-demo.location
#   size                = "Standard_B1ms"
#   admin_username      = "nidhish"
#   network_interface_ids = [
#     azurerm_network_interface.terra-demo.id,
#   ]



resource "azurerm_linux_virtual_machine" "terra-demo" {
  name                  = "terra-demo-machine01"
  location              = azurerm_resource_group.terra-demo.location
  resource_group_name   = azurerm_resource_group.terra-demo.name
  network_interface_ids = [azurerm_network_interface.terra-demo.id]
  size                  = "Standard_B1ms"
  admin_username        = "nidhish" # Provide a username
  admin_password        = "P@$$w0rd1234!"

  # Modify the disable_password_authentication attribute to false
  disable_password_authentication = false

  #   admin_ssh_key {
  #     username   = "nidhish"
  #     public_key = file("C:/Users/Nidhish Malav/.ssh/work-key.pem.pub")
  #   }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
resource "azurerm_network_interface_security_group_association" "terra-demo" {
  network_interface_id      = azurerm_network_interface.terra-demo.id
  network_security_group_id = azurerm_network_security_group.terra-demo.id

}