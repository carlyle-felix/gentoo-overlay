# Gentoo-overlay

### This repository is intended to be used alongside the official repository. It contains some packages not found in the official repo but is dependant on the official repo.

## Packages
- `gnome-base/gnome-vanilla`  (GNOME 49)  
    - A vanilla gnome desktop meta package.
    - |  USE flag | description  |
        |---:|---|
        | `webkit` | build and install both `webkit-gtk` and `yelp`. |
        | `browser` | build and install Epiphany (requires `webkit`). |
        | `webcam` | build and install GNOME's `snapshot` camera app. |
        | `qemu` | build and install `gnome-boxes` |   

- `media-sound/decibels`
- `media-video/showtime`
- `media-video/snapshot`
- `net-p2p/fragments`
- `gnome-base/gnome-initial-setup`
- `gnome-extra/malcontent`
- `gnome-extra/gnome-tour`

## Notes
- As a result of removing many of the patches from the original ebuilds found in the gentoo official repo, this is unlikely to work as expected on openrc systems.
- Gnome-boxes has a circular dependency issue that can be solved by first emerging spice without the smartcard use flag set, then emerging gnome-boxes.
    ```
    # USE="-smartcard" emerge -1a app-emulation/spice
    ```