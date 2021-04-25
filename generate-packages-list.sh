#!/bin/bash

# chaotic-aur
comm -12 <(pacman -Qq | sort) <(pacman -Sql chaotic-aur | sort) | awk '{print $1}' > packages-chaotic.txt

# aur
pacman -Qm | awk '{print $1}' > packages-aur.txt

# other
if [[ -f "packages.txt" ]]; then
	rm packages.txt
fi

for package in $(pacman -Qe | awk '{print $1}'); do
	if [[ -z $(grep ${package} packages-chaotic.txt; grep ${package} packages-aur.txt) ]]; then
		echo $package >> packages.txt
	fi
done
