# import addon
rm -rf plugin.audio.qobuz
cp -a ../plugin.audio.qobuz plugin.audio.qobuz
# update xmls
python addons_xml_generator.py
# clean up
find . -name *.pyc | xargs -n 1 rm 
find . -name *.pyo | xargs -n 1 rm 
dos2unix plugin.audio.qobuz/addon.xml
dos2unix script.module.requests/addon.xml
rm -rf plugin.audio.qobuz/.git
# extract ver
ver=`cat plugin.audio.qobuz/addon.xml | grep "XBMC\" version" | cut -d "=" -f 4 | sed -e "s/\"//g"`
ver2=`cat script.module.requests/addon.xml | grep "Requests\" version" | cut -d "=" -f 4 | sed -e "s/\"//g"`
# zipit
zip -r repo/plugin.audio.qobuz/plugin.audio.qobuz-$ver.zip plugin.audio.qobuz
zip -r repo/script.module.requests/script.module.requests-$ver2.zip script.module.requests
#git commit . 
# git push git@github.com:tidalf/dc.xbmc.addons.git
