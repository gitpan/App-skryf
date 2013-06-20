
use strict;
use warnings;

use 5.016003;

use ExtUtils::MakeMaker 6.30;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  "ABSTRACT" => "Blogging blog blog",
  "AUTHOR" => "Adam Stokes <hackr\@cypherbook.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "File::ShareDir::Install" => "0.03"
  },
  "DISTNAME" => "App-skryf",
  "EXE_FILES" => [
    "bin/skryf"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::skryf",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Data::Dump" => 0,
    "DateTime" => 0,
    "Exporter" => 0,
    "File::ShareDir" => 0,
    "FindBin" => 0,
    "List::Objects::WithUtils" => 0,
    "Mojo::Base" => 0,
    "Mojolicious::Lite" => 0,
    "Mojolicious::Plugin::Blog" => 0,
    "Path::Tiny" => 0,
    "Rex" => 0,
    "Rex::Config" => 0,
    "Text::Markdown" => 0,
    "base" => 0,
    "strictures" => 1,
    "vars" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}


