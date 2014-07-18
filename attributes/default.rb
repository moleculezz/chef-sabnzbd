default['sabnzbd']['user'] = "sabnzbd"
default['sabnzbd']['group'] = "sabnzbd"
default['sabnzbd']['host'] = "localhost"
default['sabnzbd']['port'] = "8080"
default['sabnzbd']['download_dir'] = "Downloads/incomplete"
default['sabnzbd']['complete_dir'] = "Downloads/complete"
default['sabnzbd']['api_key'] = ""
default['sabnzbd']['rating_api_key'] = ""
default['sabnzbd']['nzb_key'] = ""

default['sabnzbd']['permissions'] = ""
default['sabnzbd']['fail_hopeless'] = "1"
default['sabnzbd']['top_only'] = "1"
default['sabnzbd']['pause_on_post_processing'] = "1"
default['sabnzbd']['safe_postproc'] = "0"
default['sabnzbd']['enable_tv_sorting'] = "0"
default['sabnzbd']['tv_categories'] = ","
default['sabnzbd']['tv_sort_string'] = ""
default['sabnzbd']['enable_movie_sorting'] = "0"
default['sabnzbd']['movie_categories'] = "movies,"
default['sabnzbd']['movie_sort_string'] = ""
default['sabnzbd']['ignore_samples'] = "0"
default['sabnzbd']['cleanup_list'] = ","
default['sabnzbd']['pre_check'] = "0"
default['sabnzbd']['no_dupes'] = "0"
default['sabnzbd']['quota_period'] = "m"
default['sabnzbd']['quota_day'] = ""
default['sabnzbd']['quota_size'] = ""
default['sabnzbd']['quota_resume'] = "0"
default['sabnzbd']['download_free'] ="8G"
default['sabnzbd']['schedlines'] = ","
default['sabnzbd']['script_dir'] = ""

default['sabnzbd']['servers'] = []
default['sabnzbd']['categories'] = [
  {
    "name" => "*",
    "priority" => "",
    "pp" => "3",
    "script" => "None",
    "newsbin" => "",
    "dir" => ""
  },
  {
    "name" => "music",
    "priority" => "-100",
    "pp" => "",
    "script" => "Default",
    "newsbin" => "Music",
    "dir" => "music"
  },
  {
    "name" => "tv",
    "priority" => "-100",
    "pp" => "",
    "script" => "nzbToSickBeard.py",
    "newsbin" => "TV",
    "dir" => "tv"
  },
  {
    "name" => "movies",
    "priority" => "-100",
    "pp" => "",
    "script" => "nzbToCouchPotato.py",
    "newsbin" => "Movies",
    "dir" => "movies"
  }
]

default['nzbtomedia']['git_url'] = "https://github.com/clinton-hall/nzbToMedia.git"
default['nzbtomedia']['git_ref'] = "4f7e4b3808079a490bc042d03d30318c8c3f9f64" # v10.3
default['nzbtomedia']['install_dir'] = "/home/#{node['sabnzbd']['user']}/.nzbToMedia"
default["nzbtomedia"]['general']['version_notify'] = "0"
default["nzbtomedia"]['general']['check_media'] = "0"
default["nzbtomedia"]['couchpotato']['category']['name'] = "movies"
default["nzbtomedia"]['couchpotato']['category']['enabled'] = "1"
default["nzbtomedia"]['couchpotato']['apikey'] = "f65256c4554d412bbd6f10ab40958040"
default["nzbtomedia"]['couchpotato']['port'] = "5050"
default["nzbtomedia"]['sickbeard']['category']['name'] = "tv"
default["nzbtomedia"]['sickbeard']['category']['enabled'] = "1"
default["nzbtomedia"]['sickbeard']['port'] = "8081"
default["nzbtomedia"]['nzb']['default_download_dir'] = node['sabnzbd']['complete_dir']
