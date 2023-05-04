DOCKER_ENV_VARS = \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM=1" 

define xhost_activate
	@echo "Enabling local xhost sharing:"
	@echo "  Display: ${DISPLAY}"
	@xhost local:root
endef

DOCKER_VOLUMES = \
	--volume="$(shell pwd)":"/ws":rw \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume="${HOME}/.Xauthority:/root/.Xauthority:rw" 

.PHONY: build
build:
	@docker buildx build --platform linux/arm64/v8 -t pid . 

.PHONY: calc
calc:
	@echo "Calculating Z ..."
#@sudo xhost + 
	@docker run -it ${DOCKER_VOLUMES} pid bash -c "cd scripts && python3 calc.py"