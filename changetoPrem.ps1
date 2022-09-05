 #Ryan Mangan
 #Ryanmangansitblog
 #example change all disks to premium can be reversed to standard HDD
 #Notes: VM must be deallocated. 
 
 Select subscription

        Get-AzSubscription -SubscriptionName "Subscription Name" | select-AzSubscription    



#Name of the Azure Resource Group on which the VM's are located

$rgName = 'Resource Group Name' #enter resourcegroupname

 

# Choose Disk Type Standard_LRS, StandardSSD_LRS or Premium_LRS

$storageType = 'Premium_LRS'

 

#Retrieve the Name of the Virtual Machine

$vmNames = 'VM Name' #enter vm name

 



foreach ($vmName in $vmNames) {

        # Stop the VM before changing the Size/Disktype

        Stop-AzVM -ResourceGroupName $rgName -Name $vmName -Force

 

        $vm = Get- AzVM -Name $vmName -resourceGroupName $rgName

 

# Not all sizes supports Premium Disk and the VMSize has to be upgraded. Skip the below if it not suits your 

#$vm.HardwareProfile.VMSize = $size

#Update-AzVM -VM $vm -ResourceGroupName $rgName

 

# Get all disks that belong to the selected VM, convert to Premium Disk

        $vmDisks = Get-AzDisk -ResourceGroupName $rgName

# For disks that belong to the selected VM, Convert to Premium Disk

foreach ($disk in vmDisks)

{

    if($disk_ManagedBy -eq $vm.Id)

    {

        $disk.Sku = [Microsoft.Azure.Management.Compute.Models.DiskSku]::new($storageType)

        $disk | Update-AzDisk

    }

}

Start-AzVM -ResourceGroupName $rgName -Name $vmName

Write-Output $vmName | Out-File 'Path to the log File' -Append

}
