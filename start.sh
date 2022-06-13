tracker_list=`curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt | awk '$1' | tr '\n' ',' | cat`
qbit_trackers_list=$(curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt https://ngosang.github.io/trackerslist/trackers_all_http.txt https://newtrackon.com/api/all https://raw.githubusercontent.com/DeSireFire/animeTrackerList/master/AT_all.txt https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_tracker.txt https://raw.githubusercontent.com/hezhijie0327/Trackerslist/main/trackerslist_exclude.txt | awk '$0' | tr '\n' ',')
echo -e "\nmax-concurrent-downloads=7\nbt-tracker=$tracker_list" >> /usr/src/app/aria.conf
echo -e "\nBittorrent\add_trackers=$=$qbit_trackers_list" >> /usr/src/app/qBittorrent.conf
aria2c --conf-path=/usr/src/app/aria.conf
python3 -m bot
