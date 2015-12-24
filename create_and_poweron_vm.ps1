#虚拟机批量创建并开启脚本
#

$vc = '192.168.228.200' #VCenter IP
Connect-VIServer -Server $vc -username "administrator@vsphere.local" -Password "123456Aa?"
$template="vm_template_for_batch"
$endipscope=1..1000
$hostscope=131..132
foreach ($hostindex in $hostscope)
{
	$vmhost="192.168.227."+$hostindex
	$namestart="vm"+$hostindex+"_"
	$datastore="ds"+$hostindex
	foreach ($endip in $endipscope)
	{ 
		$name=$namestart+$endip
		New-vm -vmhost $vmhost -Name $name -Template $template -Datastore $datastore
		Start-VM -VM $name -RunAsync
	}
}
