SUBDIRS = src conf doc module test

.PHONY: all
all:
	for i in $(SUBDIRS); do cd $$i; make; cd ..; done

.PHONY: install
install:
	for i in $(SUBDIRS); do cd $$i; make install; cd ..; done

.PHONY: uninstall
uninstall:
	for i in $(SUBDIRS); do cd $$i; make uninstall; cd ..; done

.PHONY: clean
clean:
	for i in $(SUBDIRS); do cd $$i; make clean; cd ..; done

.PHONY: dkms
dkms:
	cd module; make dkms; cd ..

.PHONY: tools-install
tools-install:
	cd src; make; make install; \
	cd ../conf; make install; \
	cd ../doc; make install; cd ..

.PHONY: tools-uninstall
tools-uninstall:
	cd src; make uninstall; \
	cd ../conf; make uninstall; \
	cd ../doc; make uninstall; cd ..
