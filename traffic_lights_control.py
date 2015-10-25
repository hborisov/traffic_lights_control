import usb.core
import usb.util
import sys


def sendCommand(command):
	# find our device
	dev = usb.core.find(idVendor=0x04d8, idProduct=0x003f)

	# was it found?
	if dev is None:
	    raise ValueError('Device not found')

	# set the active configuration. With no arguments, the first
	# configuration will be the active one
	dev.set_configuration()

	# get an endpoint instance
	cfg = dev.get_active_configuration()
	intf = cfg[(0,0)]

	ep = usb.util.find_descriptor(
	    intf,
	    # match the first OUT endpoint
	    custom_match = \
	    lambda e: \
	        usb.util.endpoint_direction(e.bEndpointAddress) == \
	        usb.util.ENDPOINT_OUT)

	assert ep is not None
	ep.write(command)

if __name__ == "__main__":
	if len(sys.argv) != 2:
		print '''wrong usage! \r\n Please use: \r\ntraffic_lights_control.py <command>'''
		sys.exit(-1)
	
	command = chr(int(sys.argv[1],0))
	print command
	sendCommand(command)

		



