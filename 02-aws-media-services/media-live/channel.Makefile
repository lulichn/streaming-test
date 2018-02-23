AWS = aws
CRT_CHANNEL = medialive create-channel
DEL_CHANNEL = medialive delete-channel

channel: SHELL:=/bin/bash
channel:
	cat templates/channel.json | ./bin/mo > channel.json
	aws medialive create-channel --cli-input-json file://channel.json --query '' --output text > channel

clean:
	$(eval id := $(shell cat channel))
	-$(AWS) $(DEL_CHANNEL) --channel-id $(id)
	-rm channel channel.json

