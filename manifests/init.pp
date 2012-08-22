class aws_tools($path = "/opt")  {

    include git

    if !defined(Package['bzip2']) {
        package { 'bzip2':
            ensure => 'installed',
        }
    }

    file { "$path":
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => 0755,
    }

    git::clone { "aws-tools-clone":
        url => "https://github.com/osoco/aws-tools.git",
        path => "$path/aws-tools",
	username => "",
	password => "",
        require => File["$path"]
    }

    git::pull { "aws-tools-pull":
        path => "$path/aws-tools",
    }

}
