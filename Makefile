flatpak-builder = flatpak run org.flatpak.Builder
# flatpak-builder = flatpak-builder

update: update-flatpak update-gtk2

update-flatpak:
	$(flatpak-builder) --repo=.FlatColor-16.repo --force-clean build org.gtk.Gtk3theme.FlatColor-16.yaml
	flatpak update -y org.gtk.Gtk3theme.FlatColor-16

update-gtk2:
	./gtk-2.0/update-theme.sh

install:
	flatpak remote-add --no-gpg-verify FlatColor-16 .FlatColor-16.repo
	flatpak install FlatColor-16 org.gtk.Gtk3theme.FlatColor-16

.PHONY: update update-flatpak update-gtk2 install
