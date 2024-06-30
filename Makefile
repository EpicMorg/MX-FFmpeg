VERSION             =  "2024.06.30"
AUTHOR              =  "EpicMorg"
MODIFIED            =  "STAM"

app:
	@make -s version
	@make -s help

version:
	@echo "=================================================="
	@echo " MXVideoPlayer FFMpeg Custom Library, version: ${VERSION}, [` git branch --show-current `]"
	@echo "=================================================="

help:
	@echo "make help                         - show this help."
	@echo "make version                      - show version of this repository."
	@echo "make chmod                        - find and fix chmod of '*.sh' and other binary files."
	@echo "make build                        - start building."
	@echo "make clean                        - start cleanup."

git:
	git add .
	git commit -am "make - autocommit"
	git push

chmod:
	@echo "=============================================================================="
	@echo "===== Forced set file permissions before start ====="
	@echo "=============================================================================="
	find . -iname '*.sh' -type f | xargs chmod +x
	find . -iname '*-sh' -type f | xargs chmod +x
	find . -iname '*.mk' -type f | xargs chmod +x
	find . -iname 'configure' -type f | xargs chmod +x
	find . -iname 'config' -type f | xargs chmod +x
	find . -iname 'compile' -type f | xargs chmod +x
	find . -iname 'depcomp' -type f | xargs chmod +x
	find . -iname 'missing' -type f | xargs chmod +x
	find . -iname 'gitmake' -type f | xargs chmod +x
	find . -iname 'gitconfigure' -type f | xargs chmod +x
	@echo "=============================================================================="
	@echo "===== Forced set file permissions: Done ====="
	@echo "=============================================================================="

clean:
	@echo "=============================================================================="
	@echo "===== Cleanup before start ====="
	@echo "=============================================================================="
	rm -rfv `pwd`/ffmpeg/obj
	rm -rfv `pwd`/_dist
	git reset --hard
	git clean -d --force
	git reset --hard
	@echo "=============================================================================="
	@echo "===== Cleanup before start: Done ====="
	@echo "=============================================================================="

pack:
	@echo "=============================================================================="
	@echo "===== Start Packing ====="
	@echo "=============================================================================="
	cd `pwd`/ffmpeg/JNI	&& pwd && make pack
	@echo "=============================================================================="
	@echo "===== Packing: Done ====="
	@echo "=============================================================================="

build:
	make clean
	make chmod
	@echo "=============================================================================="
	@echo "===== Starting of product build ====="
	@echo "=============================================================================="
	cd `pwd`/ffmpeg/JNI	&& pwd && make build
	@echo "=============================================================================="
	@echo "===== Build: Done ====="
	@echo "=============================================================================="
	make pack