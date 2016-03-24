FROM alpine:3.3

MAINTAINER Scott Eppler <k.scott.eppler@gmail.com>

RUN apk --no-cache add subversion
RUN mkdir /src/ && mkdir /src/.svnrepos/
RUN svnadmin create /src/.svnrepos/my-repos
RUN svn mkdir -m "Create directory structure." file:///src/.svnrepos/my-repos/trunk file:///src/.svnrepos/my-repos/branches file:///src/.svnrepos/my-repos/tags

VOLUME ["/src"]
COPY conf /src/.svnrepos/my-repos

EXPOSE 3690

ENTRYPOINT ["/bin/sh"]
