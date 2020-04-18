echo "Select which Build"
echo "1. Carbon"
echo "2. Carbon + build"
echo "3. Ancient"
echo "4. Ancient + build"
echo "5. Other"

read whichBuild

if [[ $whichBuild -eq 1 ]]; then
	if [[ -d "carbon" ]]; then
		echo "Directory for Carbon already exists!"
	else
		`mkdir carbon`
		cd $HOME/carbon
		echo "Currentlt in directory :"`pwd`
		`repo init -u https://github.com/CarbonROM/android.git -b cr-8.0 && repo sync -f`
		echo "Done sync sources from Carbon"
		echo "Clonning Kernel..."
		`git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git -b derp10 kernel/xiaomi/msm8953`
		echo "Kernel clonning complete"
		echo "Clonning vendor..."
		`git clone https://github.com/Abhinavgupta371/proprietary_vendor_xiaomi -b lineage-17.0 vendor/xiaomi`
		echo "Vendor clonning complete"
		echo "Clonning device tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_tissot-1 -b cr-8.0 device/xiaomi/tissot`
		echo "Device tree clonning complete"
		echo "Clonnin common tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_msm8953-common -b lineage-17.0 device/xiaomi/msm8953-common`
		echo "Common tree clonning complete"
		echo "Procceed with building? (yes/no)"
		read procBuild
		if [[ $procBuild -eq "yes" ]]; then
			`. build/envsetup.sh`
			`lunch carbon_tissot-user`
			`mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && make carbon -j8`
		elif [[ $procBuild -eq "no" ]]; then
				echo "Okay. All done."
			else
				echo "Invalid Input!"
		fi
	fi
elif [[ $whichBuild -eq 2 ]]; then
	if [[ -d "carbon" ]]; then
		echo "Directory for Carbon already exists!"
	else
		`mkdir carbon`
		cd $HOME/carbon
		echo "Currentlt in directory :"`pwd`
		`repo init -u https://github.com/CarbonROM/android.git -b cr-8.0 && repo sync -f`
		echo "Done sync sources from Carbon"
		echo "Clonning Kernel..."
		`git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git -b derp10 kernel/xiaomi/msm8953`
		echo "Kernel clonning complete"
		echo "Clonning vendor..."
		`git clone https://github.com/Abhinavgupta371/proprietary_vendor_xiaomi -b lineage-17.0 vendor/xiaomi`
		echo "Vendor clonning complete"
		echo "Clonning device tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_tissot-1 -b cr-8.0 device/xiaomi/tissot`
		echo "Device tree clonning complete"
		echo "Clonnin common tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_msm8953-common -b lineage-17.0 device/xiaomi/msm8953-common`
		echo "Common tree clonning complete"
		echo "Procceed with building..."
		`. build/envsetup.sh`
		`lunch carbon_tissot-user`
		`mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && make carbon -j8`
	fi

elif [[ $whichBuild -eq 3 ]]; then
	if [[ -d "ancient" ]]; then
		echo "Directory for Ancient already exists!"
	else
		`mkdir ancient`
		cd $HOME/ancient
		echo "Currentlt in directory :"`pwd`
		echo "Initializing repo..."
		`repo init -u https://github.com/Ancient-Lab/manifest -b ten`
		echo "Done nitializing sources from Ancient"
		echo "Syncing sources..."
		`repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags`
		echo "Done sync sources from Ancient"
		echo "Clonning Kernel..."
		`git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git -b derp10 kernel/xiaomi/msm8953`
		echo "Kernel clonning complete"
		echo "Clonning vendor..."
		`git clone https://github.com/Abhinavgupta371/proprietary_vendor_xiaomi -b lineage-17.0 vendor/xiaomi`
		echo "Vendor clonning complete"
		echo "Clonning device tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_tissot-1 -b ancient device/xiaomi/tissot`
		echo "Device tree clonning complete"
		echo "Clonnin common tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_msm8953-common -b lineage-17.0 device/xiaomi/msm8953-common`
		echo "Common tree clonning complete"
		echo "Procceed with building? (yes/no)"
		read procBuild
		if [[ $procBuild -eq "yes" ]]; then
			`. build/envsetup.sh`
			`lunch ancient_tissot-user`
			`mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && make bacon -j8`
		elif [[ $procBuild -eq "no" ]]; then
				echo "Okay. All done."
			else
				echo "Invalid Input!"
		fi
	fi
elif [[ $whichBuild -eq 4 ]]; then
	if [[ -d "ancient" ]]; then
		echo "Directory for Ancient already exists!"
	else
		`mkdir ancient`
		cd $HOME/ancient
		echo "Currentlt in directory :"`pwd`
		echo "Initializing repo..."
		`repo init -u https://github.com/Ancient-Lab/manifest -b ten`
		echo "Done nitializing sources from Ancient"
		echo "Syncing sources..."
		`repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags`
		echo "Done sync sources from Ancient"
		echo "Clonning Kernel..."
		`git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git -b derp10 kernel/xiaomi/msm8953`
		echo "Kernel clonning complete"
		echo "Clonning vendor..."
		`git clone https://github.com/Abhinavgupta371/proprietary_vendor_xiaomi -b lineage-17.0 vendor/xiaomi`
		echo "Vendor clonning complete"
		echo "Clonning device tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_tissot-1 -b ancient device/xiaomi/tissot`
		echo "Device tree clonning complete"
		echo "Clonnin common tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_msm8953-common -b lineage-17.0 device/xiaomi/msm8953-common`
		echo "Common tree clonning complete"
		echo "Procceed with building..."
		`. build/envsetup.sh`
		`lunch ancient_tissot-user`
		`mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && make bacon -j8`
	fi
elif [[ $whichBuild -eq 5 ]]; then
	echo "Name of build you wanna make?"
	read name
	if [[ -d "$name" ]]; then
		echo "Directory for $name already exists!"
	else
		`mkdir $name`
		cd $HOME/$name
		echo "Currentlt in directory :"`pwd`
		echo "Enter initialize repo command"
		read repocomand
		`$repocomand`
		echo "Syncing sources..."
		`repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags`
		echo "Done nitializing sources from $name"
		echo "Clonning Kernel..."
		`git clone https://github.com/DerpFest-Devices/kernel_xiaomi_msm8953.git -b derp10 kernel/xiaomi/msm8953`
		echo "Kernel clonning complete"
		echo "Clonning vendor..."
		`git clone https://github.com/Abhinavgupta371/proprietary_vendor_xiaomi -b lineage-17.0 vendor/xiaomi`
		echo "Vendor clonning complete"
		echo "Clonning device tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_tissot-1 -b lineage-17.0 device/xiaomi/tissot`
		echo "Device tree clonning complete"
		echo "Clonnin common tree..."
		`git clone https://github.com/VictorDoom022/android_device_xiaomi_msm8953-common -b lineage-17.0 device/xiaomi/msm8953-common`
		echo "Common tree clonning complete"
	fi
else
	echo "Invalid Input!"
fi

