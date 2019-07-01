############################################################ STOREID.PL ##################################################################
############################################ Menjelang Pilkada/pilgub/pilpres Hati-Hati ##################################################
########################################################## Jadi Alat Politik #############################################################
################################################# yang lain lari terkencing-kencing ######################################################
##################################################### mengkafirkan yang lainnya ##########################################################
#!/usr/bin/perl
$| = 1;

while (<>) {

@X = split;
if ($X[0] =~ m/^http.*/) {
	$u		= $X[0];
	$rf	= $X[1];
	$urf	= $X[0] ." ". $X[1];	
} else { 
	$c		= $X[0];
	$u		= $X[1];
	$rf	= $X[2];
	$urf	= $X[1] ." ". $X[2];
}

#youtube googlevideo
if ($u =~ m/^https?\:\/\/.*google.*video(playback|goodput).*/){
	@cpn	= m/[=%&?\/]cpn[=%&?\/]([^\&\s]*)/;
	@id	= m/[=%&?\/]id[=%&?\/]([^\&\s]*)/;
	@itag	= m/[=%&?\/]itag[=%&?\/]([\d]*)/;
	@range	= m/[=%&?\/]range[=%&?\/]([\d]*-[\d]*)/;
	@mime	= m/[=%&?\/]mime[=%&?\/]([^\&\s]*)/;
	if ($rf =~ m/^https?\:\/\/www\.youtube\.com\/(watch\?v|embed|v)[=%&?\/]([^\&\s\?]*)/){
		@id	= $2;
	} else {
		if (defined(@cpn[0])){
			if (-e "/tmp/@cpn"){
				open FILE, "/tmp/@cpn";
				@id = <FILE>;
				close FILE;
			}
		}
	}
	$out="OK store-id=http://squid/google/video/id=@id/itag=@itag/mime=@mime/range=@range";

#youtube parameter
} elsif (
	($u =~ m/^https?\:\/\/.*youtube.*(stream_204|watchtime|qoe|atr|csi_204|playback).*[=%&?\/]docid[=%&?\/]([^\&\s]*)/) ||
	($u =~ m/^https?\:\/\/.*youtube.*(ptracking|set_awesome).*[=%&?\/]video_id[=%&?\/]([^\&\s]*)/) ||
	($u =~ m/^https?\:\/\/.*youtube.*(player_204).*[=%&?\/]v[=%&?\/]([^\&\s]*)/)
	){
	@id	= $2;
	@cpn    = m/[=%&?\/]cpn[=%&?\/]([^\&\s]*)/;
	if ($rf !~ m/^https?\:\/\/www\.youtube\.com\/(watch\?v|embed|v)[=%&?\/]([^\&\s\?]*)/){
		unless (-e "/tmp/@cpn"){
			open FILE, ">/tmp/@cpn";
			print FILE @id;
			close FILE;
		}
	}
	$out = "ERR";

#utmgif
} elsif ($u =~ m/^https?\:\/\/www\.google-analytics\.com\/__utm\.gif\?.*/) {
	$out="OK store-id=http://squid/google-analytics/__utm.gif";

#fbcdn.net or akamaihd.net video range
#Mamam yuk Guys
		   
} elsif ($u =~ m/http.*\.(fbcdn|akamaihd)\.net\/h(profile|photos).*[\d\w].*\/([\w]\d+x\d+\/.*\.[\d\w]{3}).*/) {
	$out="OK store-id=http://squid/$2/$3";

} elsif ($u =~ m/^http(.*)static(.*)(akamaihd|fbcdn).net\/rsrc.php\/(.*\/.*\/(.*).(js|css|png|gif))(\?(.*)|$)/) {
	$out="OK store-id=http://squid/$5/$6";

} elsif ($u =~ m/http.*\.(fbcdn|akamaihd)\.net\/h(profile|photos).*[\d\w].*\/([\w]\d+x\d+\/.*\.[\d\w]{3}).*/) {
	$out="OK store-id=http://squid/$1/$2/$3";

} elsif ($u =~ m/http.*\.(fbcdn|akamaihd)\.net\/h(profile|photos).*[\d\w].*\/([\w]\d+x\d+\/.*\.[\d\w]{3}).*/) {
	$out="OK store-id=http://squid/$2/$3";

} elsif ($u =~ m/^http(.*)static(.*)(akamaihd|fbcdn).net\/rsrc.php\/(.*\/.*\/(.*).(js|css|png|gif))(\?(.*)|$)/) {
	$out="OK store-id=http://squid/$5/$6";

} elsif ($u=~ m/^https?:\/\/[a-zA-Z0-9\-\_\.\%]*(fbcdn|akamaihd)[a-zA-Z0-9\-\_\.\%]*net\/rsrc\.php\/(.*)/) { 
	$out="OK store-id=http://squid/$2";

} elsif ($u =~ m/^https?\:\/\/.*(profile|photo|creative).*\.ak\.fbcdn\.net\/((h|)(profile|photos)-ak-)(snc|ash|prn)[0-9]?(.*)/) {
	$out="OK store-id=http://squid/$2/fb/$6";

} elsif ($u =~ m/^https?:\/\/.*(profile|photo|creative)*.akamaihd\.net\/((h|)(profile|photos|ads)-ak-)(snc|ash|prn|frc[0-9])[0-9]?(.*)/) {
	$out="OK store-id=http://squid/$2/$5/$6";

} elsif ($u =~ m/^https?\:\/\/.*(fbcdn\.net|akamaihd\.net).*\/([\w-]+\.[\w]{2,4}).*(bytestart[=%&?\/][\d]+[&\/]byteend[=%&?\/][\d]+)/) {
	$out="OK store-id=http://squid/$1/$2/$3";

#fbcdn.net or akamaihd.net with size
} elsif ($u =~ m/^https?\:\/\/.*(fbcdn\.net|akamaihd\.net).*\/([a-zA-Z][\d]+[x][\d]+\/[\w-]+\.[\w]{2,4})($|\?)/) {
	$out="OK store-id=http://squid/$1/$2";

#fbcdn.net or akamaihd.net safe_image.php
} elsif ($u =~ m/^https?\:\/\/.*(fbcdn\.net|akamaihd\.net).*\/safe_image\.php\?(.*)/) {
	$out="OK store-id=http://squid/$1/$2";

# Mamam yuk Guys

#reverbnation
} elsif ($u =~ m/^https?\:\/\/c2lo\.reverbnation\.com\/audio_player\/ec_stream_song\/(.*)\?.*/) {
	$out="OK store-id=http://squid/reverbnation/$1";
 
#playstore
} elsif ($u =~ m/^https?\:\/\/.*\.c\.android\.clients\.google\.com\/market\/GetBinary\/GetBinary\/(.*\/.*)\?.*/) {
	$out="OK store-id=http://squid/android/market/$1";


#filehost
} elsif ($u =~ m/^https?\:\/\/.*datafilehost.*\/get\.php.*file\=(.*)/) {
	$out="OK store-id=http://squid/datafilehost/$1";


#speedtest
} elsif ($u =~ m/^https?\:\/\/.*(speedtest|espeed).*\/(.*\.(txt|jpg)).*/) {
	$out="OK store-id=http://squid/speedtest/$2";


#filehippo
} elsif ($u =~ m/^https?\:\/\/.*\.filehippo\.com\/.*\/([\w-]+\.[\w]{2,4})\?.*/) {
	$out="OK store-id=http://squid/filehippo/$1";


#4shared preview.mp3
} elsif ($u =~ m/^https?\:\/\/.*\.4shared\.com\/.*\/(.*\/.*)\/dlink.*preview.mp3/) {
	$out="OK store-id=http://squid/4shared/preview/$1";

#4shared
} elsif ($u =~ m/^https?\:\/\/.*\.4shared\.com\/download\/(.*\/.*)\?tsid.*/) {
	$out="OK store-id=http://squid/4shared/download/$1";

#savefile-animeindo.tv
} elsif ($u =~ m/^https?:\/\/www\.savefile\.co\:182\/.*\/(.*\.(mp4|flv|3gp)).*/) {
	$out="OK store-id=http://squid/savefile:182/$1";

#imdb
} elsif ($u =~ m/^https?\:\/\/video\-http\.media\-imdb\.com\/(.*\.mp4)\?.*/) {
	$out="OK store-id=http://squid/imdb/$1";

#sourceforge
} elsif ($u =~ m/^https?\:\/\/.*\.dl\.sourceforge\.net\/([\w-]+\.[\w]{2,3})/) {
	$out="OK store-id=http://squid/sourceforge/$1";

#yt_download
} elsif ($u =~ m/^http:\/\/.*\.youtubeinmp3\.com(.*[^\&\s]*).*/) {
        $out="OK store-id=http://squid/$1";

} elsif ($u =~ m/^http:\/\/(.*\.youtubeinmp3\.com)(.*[^\&\s]*).*/) {
        $out="OK store-id=http://squid/$1/$2";

#steampowered dota 2
} elsif ($u =~ m/^https?\:\/\/.*steam(powered|content).*\/((client|depot)\/[\d]+\/(chunk|manifest)\/[^\?\s]*).*/) {
	$out="OK store-id=http://squid/steam/content-powered/$2";

} else {
	$out="ERR";
}

if ($X[0] =~ m/^http.*/) {
	print "$out\n";
} else {
	print "$c $out\n";
}
} 
