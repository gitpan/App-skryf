requires "App::skryf::Theme::Booshka" => "0";
requires "Carp" => "0";
requires "Class::Load" => "0";
requires "DateTime" => "0";
requires "DateTime::Format::RFC3339" => "0";
requires "Encode" => "0";
requires "File::ShareDir" => "0";
requires "FindBin" => "0";
requires "IO::Prompt" => "0";
requires "Mango" => "0";
requires "Mango::BSON" => "0";
requires "Method::Signatures" => "0";
requires "Mojo::Base" => "0";
requires "Path::Tiny" => "0";
requires "String::Dirify" => "0";
requires "String::Util" => "0";
requires "Text::MultiMarkdown" => "0";
requires "XML::Atom::SimpleFeed" => "0";
requires "constant" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "List::Util" => "0";
  requires "Test::Mojo" => "0";
  requires "Test::More" => "0";
  requires "lib" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "6.30";
  requires "File::ShareDir::Install" => "0.03";
};
