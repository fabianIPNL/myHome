# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

echo
echo "> Loading user .bashrc..."
echo

PS1="\n[\t \D{%d/%m/%Y}] \[\033[92m\]\u@\H:\[\033[94m\]\w\[\033[39m\] \n"

if [ "$HOSTNAME" = lyosrv024 ]; then
    echo "> Connected to lyosrv024"
	echo
	echo -e "\t=> Sourcing gcc 8.0 as alias 'gcc'..."
	source /data_sys/softs_matnuc/scripts/add2path.sh /data_sys/softs_matnuc/gcc72/install /lib /bin
	alias gcc=gcc72
	echo -e "\t=> Exporting $LD_LIBRARY_PATH to point to gcc 8.0 shared libs..."
	export LD_LIBRARY_PATH='/data_sys/softs_matnuc/gcc72/install/lib:/data_sys/softs_matnuc/gcc72/install/lib32:/data_sys/softs_matnuc/gcc72/install/lib64:/data_sys/softs/mpfr_inst/lib:/data_sys/softs/mpc_inst/lib:/data_sys/softs/isl_inst/lib:/data_sys/softs/gmp_inst/lib'
	#echo
fi

#echo
#echo "what is about to happen"
# $command
#echo (if another command follows)


