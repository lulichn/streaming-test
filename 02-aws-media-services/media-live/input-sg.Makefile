AWS = aws
CRT_SG = medialive create-input-security-group
DEL_SG = medialive delete-input-security-group

input-sg:
	$(AWS) $(CRT_SG) --whitelist-rules "[{\"Cidr\": \"0.0.0.0/0\"}]" \
		--query 'SecurityGroup.Id' --output text > input-sg

clean:
	$(eval id := $(shell cat input-sg))
	$(AWS) $(DEL_SG) --input-security-group-id $(id)
	rm input-sg

