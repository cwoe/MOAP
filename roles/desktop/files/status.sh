bar_sep=" | "

bar_ip() {
	echo -n "IP: " $(ip addr show dev enp1s0 | grep "inet" | tr -d '\n' | awk '{print $2}')
}

bar_time() {
	echo -n $(date "+%a %B %d %H:%M")
}

bar_memory() {
	echo -n "Memory: " $(free --si -h | tail -n 2 | head -n 1 | awk '{print $3"/"$2}')
}

bar_disk() {
	echo -n "'/':" $(df -h / | tail -n 1 | awk '{print $4}') 
}

bar_sliver() {
	port31337=$(ss -tulpn | grep 31337)
	if [ -n "$port31337" ]; then
		echo -n "Sliver: active"
	else
		echo -n "Sliver: inactive"
	fi
}

bar_vpn() {
	if ip addr show dev tun0 1>/dev/null 2>/dev/null; then 
		echo -n "VPN: " $(ip addr show dev tun0 | grep "inet" | tr -d '\n' | awk '{print $2}')
	else
		echo -n "VPN: disconnected"
	fi
	
}

while :; do
	echo \
		$(bar_vpn) \
		$bar_sep \
		$(bar_sliver) \
		$bar_sep \
		$(bar_ip) \
		$bar_sep \
		$(bar_disk) \
		$bar_sep \
		$(bar_memory) \
		$bar_sep \
		$(bar_time) \

	sleep 10
done
