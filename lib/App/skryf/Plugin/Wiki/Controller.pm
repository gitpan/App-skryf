package App::skryf::Plugin::Wiki::Controller;

use Mojo::Base 'Mojolicious::Controller';
use Method::Signatures;
use App::skryf::Model::Page;
use App::skryf::Util;

method wiki_index {
    $self->redirect_to('wiki_detail', {slug => 'IndexPage' });
}

method wiki_detail {
    my $slug  = $self->param('slug');
    my $model = App::skryf::Model::Page->new;
    my $page  = $model->get($slug);
    if (! $page) {
        $self->redirect_to('admin_wiki_new');
    } else {
      $page->{html} = App::skryf::Util->convert($page->{content});
      $self->stash(page => $page);
      $self->render('wiki/detail');
    }
}

method admin_wiki_new {
    my $method = $self->req->method;
    if ($method eq 'POST') {
        my $slug   = $self->param('slug');
        my $content = $self->param('content');
        my $model   = App::skryf::Model::Page->new;
        $model->create($slug, $content);
        $self->redirect_to('wiki_index');
    }
    else {
        $self->stash(slug => $self->param('slug'));
        $self->render('wiki/new');
    }
}

method admin_wiki_edit {
    my $slug  = $self->param('slug');
    my $model = App::skryf::Model::Page->new;
    $self->stash(page => $model->get($slug));
    $self->render('wiki/edit');
}

method admin_wiki_update {
    my $slug  = $self->param('slug');
    my $model = App::skryf::Model::Page->new;
    my $page  = $model->get($slug);
    $page->{slug}   = $self->param('slug');
    $page->{content} = $self->param('content');
    $model->save($page);
    $self->flash(message => "Saved: " . $self->param('topic'));
    $self->redirect_to(
        $self->url_for('wiki_detail', {slug => $page->{slug}}));
}

method admin_wiki_delete {
    my $slug  = $self->param('slug');
    my $model = App::skryf::Model::Page->new;
    if ($model->remove($slug)) {
        $self->flash(message => $slug . ' removed');
    }
    $self->redirect_to('wiki_index');
}

1;