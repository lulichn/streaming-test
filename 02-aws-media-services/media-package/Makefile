AWS = aws
CRE_CH = mediapackage create-channel
DEL_CH = mediapackage delete-channel
OPT = --query 'HlsIngest.IngestEndpoints[0].[Url, Username, Password]' --output text

CRE_EP = mediapackage create-origin-endpoint
DEL_EP = mediapackage delete-origin-endpoint

SET_PARAM = ssm put-parameter
DEL_PARAM = ssm delete-parameter
PKG = --hls-package '{"PlaylistType": "EVENT", "PlaylistWindowSeconds": 10, "SegmentDurationSeconds": 2}'


ALL: channelA channelB endpointA endpointB channelAP channelBP

channelA:
	$(AWS) $(CRE_CH) --id "channelA" $(OPT) > channelA

endpointA:
	$(AWS) $(CRE_EP) --channel-id channelA --id endpointA $(PKG) > endpointA

channelAP:
	$(eval pass = $(shell cat $(CURDIR)/channelA | cut -f3))
	$(AWS) $(SET_PARAM) --name channelA --type SecureString --value $(pass)

channelB:
	$(AWS) $(CRE_CH) --id "channelB" $(OPT) > channelB

endpointB:
	$(AWS) $(CRE_EP) --channel-id channelB --id endpointB $(PKG) > endpointB

channelBP:
	$(eval pass = $(shell cat $(CURDIR)/channelB | cut -f3))
	$(AWS) $(SET_PARAM) --name channelB --type SecureString --value $(pass)


clean:
	-$(AWS) $(DEL_EP) --id endpointA
	-rm endpointA

	-$(AWS) $(DEL_EP) --id endpointB
	-rm endpointB

	-$(AWS) $(DEL_CH) --id "channelA"
	-rm channelA

	-$(AWS) $(DEL_CH) --id "channelB"
	-rm channelB

	-$(AWS) $(DEL_PARAM) --name channelA
	-$(AWS) $(DEL_PARAM) --name channelB

