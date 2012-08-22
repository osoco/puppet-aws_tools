class aws-tools($path = "/opt/aws-tools")  {

    include git

    file { "/opt":
        ensure => directory,
        owner => 'root',
        group => 'root',
        mode => 0755,
    }

    git::clone { "aws-tools-clone":
        url => "https://github.com/osoco/aws-tools.git",
        path => "$path",
        require => File["/opt"]
    }

    git::pull { "aws-tools-pull":
        path => "$path",
    }

}
