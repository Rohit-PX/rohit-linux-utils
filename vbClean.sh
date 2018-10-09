
# Delete all Vbox Vms

# Power off all VBox VMs
for i in $(VBoxManage list runningvms | awk '{print $2}' | tr -d '{\|}'); 
do
	echo "Now powering off"$i
	VBoxManage controlvm $i poweroff;
done

# Unregister and delete all VBox VMs
for i in $(VBoxManage list vms | awk '{print $2}' | tr -d '{\|}'); 
do 
	echo "Now unregistering and deleting "$i
	VBoxManage unregistervm  $i --delete ;
done
