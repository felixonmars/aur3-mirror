post_install()
{
	cat <<- EOF
		==> Initialize Archipel Agent config and data files by running:
		# archipel-initinstall
		==> Also make sure that libvirtd is running before starting Archipel:
		# rc.d start libvirtd
		# rc.d start archipel
	EOF
}

post_upgrade()
{
	post_install $1
}

post_remove()
{
	cat <<- EOF
		==> You may safely delete Archipel Agent config and files:
		# rm -rf /etc/archipel /var/lib/archipel
	EOF
}
