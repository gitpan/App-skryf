package App::skryf::Model::User;

our $VERSION = '0.0016_04'; # VERSION

use Mojo::Base 'App::skryf::Model::Base';
use Method::Signatures;
use Mango::BSON ':bson';

method users {
    $self->mgo->db->collection('users');
}

method all {
    $self->users->find()->all;
}

method create ($username, $password, $attrs = {}) {
    my $user = $self->users->find_one({username => $username});
    my $bson = bson_doc
      now => bson_time,
      username => $username,
      password => $password,
      attrs => $attrs;

    if (!$user) {
        $self->users->insert($bson);
    }
    return 1;
}

method get ($username) {
    $self->users->find_one({username => $username});
}

method remove ($username) {
    $self->users->remove({username => $username});
}

method save ($user) {
  $self->users->save($user);
}

1;
__END__

=head1 NAME

App::skryf::Model::User - User Model Skryf

=head1 DESCRIPTION

User model 

=head1 METHODS

=head2 B<users>

Grabs user collection from Mongo

=head2 B<all>

Returns all users

=head2 B<check>

Checks username/password against database

=head2 B<create>

Creates a user

=head2 B<get>

Gets single user

=head2 B<remove>

Removes user

=head2 B<save>

Saves user and attributes

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>. L<Mango>.

=head1 COPYRIGHT AND LICENSE

This plugin is copyright (c) 2013 by Adam Stokes <adamjs@cpan.org>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
