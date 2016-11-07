#!/usr/bin/perl -w

use PAWR;
use LWP::Simple;

$reddit = PAWR->new();

@subreddits = qw(wallpaper wallpapers earthporn ImaginaryMindscapes);

#foreach(@subreddits){
$_ = 'earthporn';
	$response = $reddit->get_subreddit({'sort'=>'top', 'limit'=>10, 'subreddit'=>$_});
	foreach(@{$response}){
		if($_->{'is_self'} != 0){next;} # We don't want self posts - just links.	

		$post_link = $_->{'url'};
		if($post_link =~ m/([\w\d]+).(jpg|png|jpeg)$/){ # Add accepted extensions here.
			$save_name = "$1.$2"; # $1 = name $2 = extension.	
			$save_name = $ENV{'HOME'} . "/wallpaper/";
			getstore($post_link,$save_name);
		}
	}

#}



