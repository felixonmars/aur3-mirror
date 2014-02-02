#Make login from option 82 for dlink
function opt82_dlink(pkt)
	v,b1,b2,b3,b4=string.unpack(pkt:agent_remote_id():sub(-4),'bbbb')
	ip=b1..'.'..b2..'.'..b3..'.'..b4
	v,port=string.unpack(string.sub(pkt:agent_circuit_id(),'-1'),'b')
	local opt82=ip..'-'..port
--    print(opt82)
	return opt82
end
