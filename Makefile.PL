
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;

use File::ShareDir::Install;
install_share dist => "share";


my %WriteMakefileArgs = (
  "ABSTRACT" => "A CMS/CMF system for Perl.",
  "AUTHOR" => "Adam Stokes <adamjs\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "File::ShareDir::Install" => "0.03"
  },
  "DISTNAME" => "App-skryf",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "App::skryf",
  "PREREQ_PM" => {
    "App::skryf::Model::Post" => 0,
    "App::skryf::Theme::Booshka" => 0,
    "Carp" => 0,
    "Class::Load" => 0,
    "DateTime" => 0,
    "DateTime::Format::RFC3339" => 0,
    "Encode" => 0,
    "File::ShareDir" => 0,
    "FindBin" => 0,
    "IO::Prompt" => 0,
    "Mango" => 0,
    "Mango::BSON" => 0,
    "Method::Signatures" => 0,
    "Mojo::Base" => 0,
    "Path::Tiny" => 0,
    "String::Dirify" => 0,
    "String::Util" => 0,
    "Text::MultiMarkdown" => 0,
    "XML::Atom::SimpleFeed" => 0,
    "constant" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "List::Util" => 0,
    "Test::Mojo" => 0,
    "Test::More" => 0,
    "lib" => 0
  },
  "VERSION" => "0.016_02",
  "test" => {
    "TESTS" => "t/model/*.t t/web/*.t"
  }
);


my %FallbackPrereqs = (
  "App::skryf::Model::Post" => 0,
  "App::skryf::Theme::Booshka" => 0,
  "Carp" => 0,
  "Class::Load" => 0,
  "DateTime" => 0,
  "DateTime::Format::RFC3339" => 0,
  "Encode" => 0,
  "File::ShareDir" => 0,
  "FindBin" => 0,
  "IO::Prompt" => 0,
  "List::Util" => 0,
  "Mango" => 0,
  "Mango::BSON" => 0,
  "Method::Signatures" => 0,
  "Mojo::Base" => 0,
  "Path::Tiny" => 0,
  "String::Dirify" => 0,
  "String::Util" => 0,
  "Test::Mojo" => 0,
  "Test::More" => 0,
  "Text::MultiMarkdown" => 0,
  "XML::Atom::SimpleFeed" => 0,
  "constant" => 0,
  "lib" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}


