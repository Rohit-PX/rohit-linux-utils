for i in $(kubectl get nodes | grep -v "master\|NAME" | awk '{print $1}' );  
	do 
		CNT=`kubectl get pods --all-namespaces -owide  | grep -v "NAME\|default\|kube-system" | grep $i |wc -l`; 
		echo "${i}  -  ${CNT}"; 
	done
