package App::skryf::Welcome;

our $VERSION = '0.016_03'; # VERSION

use Mojo::Base 'Mojolicious::Controller';

sub index {
  my $self = shift;
  $self->render('welcome');
}

1;
