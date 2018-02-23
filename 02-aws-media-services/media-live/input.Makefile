AWS = aws
CRT_INPUT = medialive create-input
DEL_INPUT = medialive delete-input


input:
	test -f input-sg
	$(eval sg := $(shell cat input-sg))

	$(AWS) $(CRT_INPUT) --name "input" \
		--type "RTMP_PUSH" \
		--destinations "[{\"StreamName\": \"live/demo\"},{\"StreamName\": \"live/demo\"}]" \
		--input-security-groups $(sg) \
		--query 'Input.Id' --output text > input

clean:
	$(eval id := $(shell cat input))
	$(AWS) $(DEL_INPUT) --input-id $(id)
	rm input

