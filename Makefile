flashlight.dsm:
	ssh wanderer "otool -tv /Applications/Flashlight.app/Flashlight" > $@
deploy: Info.plist icon.png
	rsync -avuz $(DRYRUN) \
	 --exclude='*.pyc' \
	 . mobile@wanderer:rentacoder/jcomeau/taillight/
	rsync -avuz $(DRYRUN) \
	 $+ \
	 mobile@wanderer:Library/WebClips/com.jcomeau.taillight.webclip/
icon.png:
	convert -size 60x60 xc:red $@
