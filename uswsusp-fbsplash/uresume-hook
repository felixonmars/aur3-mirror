#!/bin/sh

run_hook ()
{
	# Ignore the /etc/suspend.conf parameter and use the kernel cmdline
	case ,$splash, in *,silent,* )
		# Wait for any Fbcondecor fade in - may take very long on broken systems
		(
			i=0
			while [ -n "$( pidof fbcondecor_helper )" ]; do
				if [ $i -ge 50 ]; then
					err "timeout on waiting for fbcondecor_helper to die!"
					exit 1
				fi
				sleep .1
				i=$(( i + 1 ))
			done
		# Resume with Fbsplash or try without
		) && \
		/usr/lib/suspend/resume -P "splash = y"
	;; * )
		# Resume without Fbsplash
		false
	esac || \
	/usr/lib/suspend/resume -P "splash = n"
}

# vim:set ft=sh:
