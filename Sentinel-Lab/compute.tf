resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "srv-linux-target"
  resource_group_name   = azurerm_resource_group.lab.name
  location              = azurerm_resource_group.lab.location
  size                  = var.vm_size
  admin_username        = "labadmin"
  network_interface_ids = [azurerm_network_interface.nic.id]
  tags                  = local.tags

  admin_ssh_key {
    username   = "labadmin"
    public_key = file("C:\\Users\\joao3\\OneDrive\\Desktop\\Cursos\\Alura\\Terraform\\Sentinel-Lab\\id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_virtual_machine_extension" "ama" {
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = azurerm_linux_virtual_machine.vm.id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  tags                       = local.tags
}