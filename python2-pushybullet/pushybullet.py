# -*- encoding: utf-8 -*-
from requests import session
from os.path import basename, expanduser
from os import fdopen
from StringIO import StringIO
import datetime
import json
import time

def get_apikey_from_config():
    try:
        from ConfigParser import SafeConfigParser as ConfigParser
    except ImportError:
        from configparser import SafeConfigParser as ConfigParser

    try:
        config = ConfigParser()
        config.read(expanduser('~/.config/pushbullet/config.ini'))
        return config.get('pushbullet', 'apikey')
    except:
        return None

def utf8(s):
    return s if isinstance(s, unicode) else unicode(s, 'utf-8')

# Events {{{
class Event(object):
    '''
    Abstract Pushbullet event
    '''
    __slots__ = ['api', 'time']
    def __init__(self, api):
        self.time = time.time()
        self.api = api

    def __repr__(self):
        return '<%s @%s>' % (self.__class__.__name__, self.time)

    def pushes(self, skip_empty=False, limit=None):
        return xrange(0)  # empty generator

    def latest_push_time(self):
        try:
            push = self.pushes(limit=1).next()
            return push.get('modified') or push.get('created')
        except (StopIteration, AttributeError):
            return None

class NopEvent(Event):
    '''
    Nop event (keep-alive ticks)
    '''
    __slots__ = ['api', 'time']

class TickleEvent(Event):
    '''
    Tickle event (user pushes)
    '''
    __slots__ = ['api', 'time', 'since', 'subtype']
    def __init__(self, api, subtype, since):
        Event.__init__(self, api)
        self.subtype = subtype
        self.since = since

    def pushes(self, skip_empty=False, limit=None):
        return self.api.pushes(since=self.since, skip_empty=skip_empty, limit=limit)

    def __repr__(self):
        return '<%s[%s] @%s>' % (self.__class__.__name__, self.subtype, self.time)

class PushEvent(Event):
    '''
    Push event (device notification mirroring)
    '''
    __slots__ = ['api', 'time', 'push']
    def __init__(self, api, push):
        Event.__init__(self, api)
        self.push = push

    def __repr__(self):
        return '<%s[%r] @%s>' % (self.__class__.__name__, self.push, self.time)

    def pushes(self, skip_empty=False, limit=None):
        yield self.push

# }}}

class PushBulletError(Exception):
    pass

class PushBulletObject(object):
    '''
    Abstract Pushbullet object for given REST endpoint
    '''

    @property
    def uri(self):
        '''
        Relative REST-object URI
        '''
        raise NotImplementedError

    def delete(self):
        '''
        Delete object
        '''
        self.api.delete(self.uri)

    def bind(self, api):
        '''
        Bind object to given API object

        :param PushBullet api: API object to bind to
        :returns: self
        '''
        assert(isinstance(api, PushBullet))
        self.api = api
        return self

    @property
    def bound(self):
        '''
        True if an object is bound to an API object
        '''
        return bool(getattr(self, 'api', None))

    def get(self, name, default=None):
        return getattr(self, name, default)

# Push targets {{{

class PushTarget(PushBulletObject):
    '''
    Abstract push target object
    '''
    def __init__(self, api, iden, **data):
        self.iden = iden
        self.__dict__.update(data)
        self.bind(api)

    @property
    def ident(self):
        '''
        Interface property with parameters to identify given push target
        :rtype: dict
        '''
        raise NotImplementedError

    def push(self, push=None, **pushargs):
        '''
        Push a message to the push target

        Either `push` or `pushargs` must be given.
        If both are present, `pushargs` are ignored.

        :param Push push: a push object
        :param dict pushargs: parameters to construct push object
        '''
        if not isinstance(push, Push):
            push = self.api.make_push(pushargs, push)

        push.send(self)
        return push

    def __str__(self):
        return unicode(self).encode('utf8')

class Contact(PushTarget):
    '''
    Contact to push to
    '''
    def __repr__(self):
        return '<Contact[%s]: %s <%s>>' % (self.iden,
                getattr(self, 'name', 'Unnamed'),
                getattr(self, 'email', None) or getattr(self, 'email_normalized'))

    def __unicode__(self):
        return u'%s <%s>' % (self.name, self.email)

    @property
    def ident(self):
        return {'email': self.email_normalized}

    @property
    def uri(self):
        return 'contacts/%s' % self.iden

    def create(self):
        if self.iden:
            raise PushBulletError('contact already exists')

        self.__dict__.update(self.api.post('contacts', name=self.name, email=self.email))
        return self

    def update(self):
        if not self.iden:
            raise PushBulletError('contact does not exist yet')

        self.__dict__.update(self.api.post(self.uri, name=self.name))
        return self

    def rename(self, newname):
        self.name = newname
        return self.update()

class Device(PushTarget):
    '''
    Device to push to
    '''
    def __repr__(self):
        return '<Device[%s]: %s>' % (self.iden,
                getattr(self, 'nickname', None) or
                getattr(self, 'model', None) or
                'Unnamed')

    def __unicode__(self):
        return (getattr(self, 'nickname', None) or
                getattr(self, 'model', None) or
                self.iden)

    @property
    def ident(self):
        return {'device_iden': self.iden}

    @property
    def uri(self):
        return 'devices/%s' % self.iden

    def create(self):
        if self.iden:
            raise PushBulletError('device already exists')

        self.__dict__.update(self.api.post('devices', nickname=self.nickname, type=getattr(self, 'type', 'stream')))
        return self

    def update(self):
        if not self.iden:
            raise PushBulletError('device does not exist yet')

        self.__dict__.update(self.api.post(self.uri, nickname=self.nickname))
        return self

    def rename(self, newname):
        self.nickname = newname
        return self.update()

class User(PushTarget):
    '''
    User profile
    '''
    def __repr__(self):
        return '<User[%s]: %s <%s>>' % (self.iden,
                getattr(self, 'name', 'Unnamed'),
                getattr(self, 'email', None) or getattr(self, 'email_normalized'))

    @property
    def ident(self):
        return {}

    @property
    def uri(self):
        return 'users/me'

    def update(self):
        self.__dict__.update(self.api.post(self.uri, preferences=getattr(self, 'preferences', {})))
        return self

    def set_prefs(self, **prefs):
        try:
            self.preferences.update(prefs)
        except AttributeError:
            self.prefereces = prefs

        return self.update()

# }}}

# Pushes {{{

class Push(PushBulletObject):
    '''
    Abstract push object
    '''
    type = None
    def __init__(self, **data):
        self.__dict__.update(data)

    def send(self, target=None):
        '''
        Send the push to some target

        If target is None (or omitted) or a string, the push must be bound to some API.
        By default the push will be sent to API object (i.e. all user devices).

        If target is a string, it must be a device iden to push to.

        If you use anything except for Device, Contact or PushBullet object as a target
        (i.e. a PushTarget object), you must make sure a push is bound to PushBullet
        object before by calling `push.bind(api)` method.
        Push is already bound if you fetched it with `api.pushes()` call
        or sent it before.

        :param target: push target
        :type target: PushTarget|str|None
        '''
        if not isinstance(target, PushTarget):
            target = self.api.make_target(target)

        self.bind(target.api)

        data = self.data
        data.update(target.ident)
        data['type'] = self.type

        result = self.api.post('pushes', **data)
        self.__dict__.update(result)

    def resend(self):
        '''
        Try to send the push to the same target again (e.g. as a part of error handling logic)
        '''
        if not hasattr(self, 'target_device_iden'):
            raise PushBulletError('push was not sent yet')

        self.send(self.target_device_iden)

    def update(self):
        self.__dict__.update(self.api.post(self.uri, dissmissed=getattr(self, 'dismissed', False)))
        return self

    def dismiss(self):
        '''
        Dismiss a push
        '''
        if getattr(self, 'dismissed', False):
            return  # don't dismiss twice

        self.dismissed = True
        return self.update()

    @property
    def data(self):
        '''
        Push data necessary to send push to a target

        :rtype: dict
        '''
        raise NotImplementedError

    def __eq__(self, other):
        return isinstance(other, Push) and self.iden == other.iden

    def __repr__(self):
        return u'<%s[%s]: %s>' % (self.__class__.__name__, getattr(self, 'iden', None), unicode(self))

    def __unicode__(self):
        return u'%s push' % getattr(self, 'type', 'general')

    @property
    def uri(self):
        return 'pushes/%s' % self.iden

class NotePush(Push):
    '''
    Note push
    '''
    type = 'note'
    def __init__(self, body='', title='', **data):
        '''
        A note push constructor

        Notes has both body and title parameters optional, but at least one of them
        must be defined for the push to be useful. The `title` argument defaults to "Note"
        by PushBullet service, so I choose to require at least `body` argument.
        If you really don't need body (you should define `title` then, or you will end up
        with empty note, which usually has no sense), set it to empty string `''`.

        :type body: str
        :type title: str
        '''
        self.title, self.body = utf8(title), utf8(body)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'body': self.body}

    def __unicode__(self):
        return self.title

class LinkPush(Push):
    '''
    Link push
    '''
    type = 'link'
    def __init__(self, url, title='', body='', **data):
        '''
        A link push constructor

        URL is the only required argument, otherwise the push is actually useless.
        You can of cause set it to empty string (`''`), but what is the use of it?

        :type url: str
        :type title: str
        :type body: str
        '''
        self.title, self.url, self.body = utf8(title), utf8(url), utf8(body)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'url': self.url, 'body': self.body}

    def __unicode__(self):
        return self.url

class AddressPush(Push):
    '''
    Address push
    '''
    type = 'address'
    def __init__(self, address, name='', **data):
        '''
        An address push constructor

        Address argument is the only required argument here.
        The push actually has no sense without it, doesn't it?

        :type address: str
        :type name: str
        '''
        self.name, self.address = utf8(name), utf8(address)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'name': self.name, 'address': self.address}

    def __unicode__(self):
        return u'%s (%s)' % (self.name, self.address)

class ListPush(Push):
    '''
    List push
    '''
    type = 'list'
    def __init__(self, items, title='', **data):
        '''
        A list push constructor

        Items argument is the only required one, and it should be a list
        of strings. Of cause you can send empty list (`[]`), but what is the use of it?

        :type items: list of str
        :type title: str
        '''
        self.title, self.items = utf8(title), map(utf8, items)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'items': self.items}

    def __unicode__(self):
        return u'%s (%d)' % (self.title, len(self.items))

class FilePush(Push):
    '''
    File push
    '''
    type = 'file'
    def __init__(self, file=None, file_name=None, file_type=None, body='', **data):
        '''
        A file push constructor

        You must specify at least `file` argument in order to be able to push some new file

        The `file` argument is optional only for internal usage, like if a file push fetched
        by `api.pushes()` method call, in which case file to push is undefined, but `file_url`
        is present to download the file. If you then resend such push, file designated by `file_url`
        will be sent, not any new file set by you. You can use this knowledge to try and
        set `file_url` directly on `FilePush` object without setting `file` argument on your
        own risk, but bear in mind it's an internal implementation detail, so please make sure you
        a) understand what you are doing, b) don't abuse the feature.

        If you specify `file` only, it must be either a file-like object, a file-handler opened for read,
        a buffer (for in-memory files), an openable object (the one with `open([mode])` method)
        or a string with absolute file path.
        You will see basename of the file (the part of path after final slash).

        If you specify both `file` and `file_name`, a push receiver will see `file_name` value
        as a file name, not the actual file name. You can use it for example to send some
        system stream without user-friendly name, like `sys.stdin`.

        The `file_type` argument is optional and must be a string in MIME-type format (e.g. `text/plain`).
        If you omit it, file type will be deteremined by magic library by file's content, and if
        autodetection will fail, file type will default to `application/octet-stream`.
        The autodetection reads first 1024 bytes of file content and then resets file's seek cursor
        to the beginning, so it won't work for non-seekable streams, so if you are about to push
        something like `sys.stdin`, make sure you set `file_type` manually.

        :param file: file to push
        :type file: str, file, buffer, int, Path or any file-like or openable object
        :param str file_name: file name to push (will be visible to reciever)
        :param str file_type: file's MIME type (will be determined by file's content if omitted)
        :param str body: optional message to accompany file
        '''
        assert(file or file_name)
        self.file, self.file_name, self.file_type = file, utf8(file_name), utf8(file_type)
        if not self.file:
            self.file = self.file_name

        self.file_url = None
        self.body = utf8(body)
        Push.__init__(self, **data)

    def send(self, target=None):
        if not isinstance(target, PushTarget):
            target = self.api.make_target(target)

        if not self.file_url:  # file not uploaded yet
            fh = (self.file if hasattr(self.file, 'read') else  # file-like object
                  self.file.open('rb') if hasattr(self.file, 'open') else  # openable object
                  fdopen(self.file, 'rb') if isinstance(self.file, int) else  # file descriptor
                  StringIO(self.file) if isinstance(self.file, buffer) else  # in-memory file
                  open(self.file, 'rb'))  # file name

            try:
                file_name = utf8(self.file_name) if self.file_name else basename(fh.name)
                file_type = utf8(self.file_type) if self.file_type else self.guess_type(fh)
                req = target.api.get('upload-request', file_name=file_name, file_type=file_type)
                target.api.upload(req['upload_url'], data=req['data'], file=fh)
                self.file_name, self.file_type, self.file_url = req['file_name'], req['file_type'], req['file_url']

            finally:
                fh.close()

        Push.send(self, target)

    def guess_type(self, file):
        try:
            import magic
            guesser = magic.open(magic.MIME_TYPE)
            guesser.load()
            mime_type = guesser.buffer(file.read(1024))
            file.seek(0)
            return mime_type or 'application/octet-stream'

        except:
            return 'application/octet-stream'

    @property
    def data(self):
        return {'file_name': self.file_name, 'file_type': self.file_type, 'file_url': self.file_url, 'body': self.body}

    def __unicode__(self):
        return self.file_name

class MirrorPush(Push):
    '''
    Mirror push (internal usage only)
    '''
    type = 'mirror'

    def send(self, target):
        raise NotImplementedError

class DismissalPush(Push):
    '''
    Dismissal push (internal usage only)
    '''
    type = 'dismissal'

    def send(self, target):
        raise NotImplementedError

# }}}

# Main API class {{{

class PushBullet(PushTarget):
    '''
    Main API class for PushBullet
    '''

    API_URL = 'https://api.pushbullet.com/v2/%s'

    def __init__(self, apikey):
        '''
        Initialize API object (get API key from https://www.pushbullet.com/account)

        :param str apikey: API key (get at https://www.pushbullet.com/account)
        '''
        self.apikey = apikey
        self.sess = session()
        self.sess.auth = (apikey, '')

    def get_type_by_args(self, args, arg=None):
        return args.get('type') or ('url' if 'url' in args else
                     'list' if 'items' in args else
                     'address' if 'address' in args else
                     'file' if 'file' in args or 'file_name' in args else
                     self.get_type_by_class(arg) if arg else
                     'note')

    def get_type_by_class(self, arg):
        if isinstance(arg, (file, buffer)):
            return 'file'

        # any iteratable (except for strings) is a list push
        if hasattr(arg, '__iter__') and not isinstance(arg, (str, unicode)):
            return 'list'

        # special case: looks like url, therefore it is an link push
        if utf8(arg).startswith(('http://', 'https://', 'ftp://', 'ftps://', 'mailto:')):
            return 'link'

        # default is a note push
        return 'note'

    def make_push(self, pushargs, pusharg=None):
        '''
        Factory to create a push object out of raw data in dictionary

        The `pushargs` dict should contain `type` element to determine
        push type. If you omit it, push type will be autodefined by presence of
        other elements, defaulting to `note`.

        Other `pushargs` elements depend on push type:

        * for `note`: `title` and `body`,
        * for `list`: `title` and `items`,
        * for `file`: `file`, `file_name`, `file_type` and `body`,
        * for `link`: `title` and `url`,
        * for `address`: `name` and `address`.

        See correspondent push classes docs for details of these arguments.

        :param dict pushargs: a dict of parameters to compose a push object
        '''
        # a set of arguments in a dictionary
        pushcls = {
                'note': NotePush,
                'list': ListPush,
                'link': LinkPush,
                'file': FilePush,
                'address': AddressPush,
                'mirror': MirrorPush,
                'dismissal': DismissalPush,
                }.get(self.get_type_by_args(pushargs, pusharg), Push)
        push = pushcls(pusharg, **pushargs) if pusharg else pushcls(**pushargs)

        return push.bind(self)

    def delete(self, _uri):
        '''
        Helper method for DELETE requests to API
        '''
        self.sess.delete(self.API_URL % _uri).raise_for_status()

    def post(self, _uri, **data):
        '''
        Helper method for POST requests to API
        '''
        response = self.sess.post(self.API_URL % _uri, data=json.dumps(data),
                headers={'content-type': 'application/json'})
        response.raise_for_status()

        result = response.json()

        if 'error' in result:
            raise PushBulletError(result['message'])

        return result

    def get(self, _uri, **params):
        '''
        Helper method for GET requests to API
        '''
        response = self.sess.get(self.API_URL % _uri, params=params)
        response.raise_for_status()

        result = response.json()

        if 'error' in result:
            raise PushBulletError(result['message'])

        return result

    def upload(self, _uri, data, **files):
        '''
        Helper method to upload a file to given URL
        '''
        response = self.sess.post(_uri, data=data, files=files, auth=()).raise_for_status()

    def iter_devices(self, skip_inactive=True, limit=None):
        '''
        Get available devices to push to

        :param bool skip_inactive: if False, fetch all devices, even inactive ones
        '''

        return self.paged('devices',
                (lambda d: d['active']) if skip_inactive else (lambda d: True),
                lambda d: Device(self, **d),
                limit=limit)


    def create_device(self, nickname, type='stream'):
        '''
        Create new (a stream) device with given nickname

        :param str nickname: device's name
        :param str type: device's type
        :rtype: Device
        '''
        return Device(self, None, nickname=nickname, type=type).create()

    def create_contact(self, name, email):
        '''
        Create a new contact with given name and email

        :param str name: contact's name
        :param str email: contact's email
        :rtype: Contact
        '''
        return Contact(self, None, name=name, email=email).create()

    def iter_contacts(self, skip_inactive=True, limit=None):
        '''
        Get available contacts to push to

        :param bool skip_inactive: if False, fetch all contacts, even inactive ones
        '''
        return self.paged('contacts',
                (lambda c: c['active']) if skip_inactive else (lambda c: True),
                lambda c: Contact(self, **c),
                limit=None)


    __contacts = None
    def contacts(self, reset_cache=False):
        '''
        Get available contacts to push to as a plain list

        :param bool reset_cache: if True, reset inner contacts cache
        '''
        if reset_cache or self.__contacts is None:
            self.__contacts = list(self.iter_contacts())

        return self.__contacts


    __devices = None
    def devices(self, reset_cache=False):
        '''
        Get available devices to push to as a plain list

        :param bool reset_cache: if True, reset inner devices cache
        '''
        if reset_cache or self.__devices is None:
            self.__devices = list(self.iter_devices())

        return self.__devices


    def __getitem__(self, device_iden):
        '''
        Find and return device object by device iden or device name

        At first search is done by device iden field, and if it's not found,
        search is repeated by device name. A device name is either device nickname,
        model or iden, whichever is defined for any given device object.

        So you can get your Chrome device object with `api["Chrome"]` call.

        Throws `KeyError` if no device is found.

        :param str device_iden: a device iden
        '''
        try:
            return next(d for d in self.devices() if d.iden == device_iden)
        except StopIteration:
            try:
                return next(d for d in self.devices() if utf8(d) == device_iden)
            except StopIteration:
                raise KeyError(device_iden)

    def pushes(self, since=0, skip_empty=True, limit=None):
        '''
        Generator fetches and yields all pushes since given timestamp

        The `since` argument, which defines time limit in the past to get
        pushes from, accepts almost any sensible date/time object.

        If it is an integer (int or long) and positive, it is expected
        to be correct unix timestamp (number of seconds since 1/1/1970 00:00:00 UTC).
        If it is an integer and negative, it is a number of seconds in the past
        (e.g. use `-86400` to fetch pushes for the last day).
        If it is a date or datetime object, it is, well, a date/time =).
        If it is a timedelta object, it is a time-span in the past
        (so `timedelta(days=7)` means "pushes for the last week").
        If it is a string, it is parsed with dateutil.parser.parse() for datetime object.

        :param since: minimal time for pushes to fetch
        :type since: int|long|date|datetime|timedelta
        :param bool skip_empty: skip empty (inactive, removed) pushes, default is True
        :param int limit: limit number of items per page
        :rtype: generator
        '''
        if isinstance(since, datetime.date):
            since = since.strftime('%s')
        elif isinstance(since, datetime.timedelta):
            since = (datetime.datetime.now() - since).strftime('%s')
        else:
            try:
                since = int(since)
                if since < 0:
                    since += time.time()
            except ValueError:
                from dateutil.parser import parse
                since = parse(since).strftime('%s')

        return self.paged('pushes',
                (lambda p: bool(p.get('type'))) if skip_empty else (lambda p: True),
                self.make_push,
                modified_after=since,
                limit=limit)


    def paged(self, _uri, _filter, _wrapper, **params):
        page = self.get(_uri, **params)

        while True:
            for item in page[_uri]:
                if _filter(item):
                    yield _wrapper(item)

            if not page.get('cursor'):
                break

            page = self.get(_uri, cursor=page['cursor'])

    __me = None
    def me(self, reset_cache=False):
        '''
        Get current user information
        '''
        if not reset_cache and self.__me:
            return self.__me

        self.__me = User(self, **self.get('users/me'))
        return self.__me

    def make_target(self, target):
        if target is None:
            return self

        if isinstance(target, PushTarget):
            return target

        target = utf8(target)
        return (Device(self, target) if '@' not in target else
                Contact(self, None, email_normalized=target))

    def push(self, push=None, target=None, **pushargs):
        '''
        Send push to a target (to all devices by default)

        If you omit `target` argument, the push will be sent to all user devices.
        If `target` is anything but `PushTarget` object, it will be cast to string
        and will be taken as a device iden to push to.

        Only one of `push` or `pushargs` arguments must be given at a time.
        If `push` is omitted, new push will be constructed from `pushargs` arguments,
        if both `push` and `pushargs` are given, `pushargs` is ignored.

        :param Push push: a push object ot push
        :param target: a push target to push to
        :type target: str|PushTarget|None
        :param dict pushargs: push arguments
        :rtype: Push
        :returns: push just sent
        '''
        if not isinstance(push, Push):
            push = self.make_push(pushargs, push)

        push.bind(self).send(target)
        return push

    def bind(self, obj):
        '''
        Bind given object to the API

        :type obj: PushBulletObject
        :returns: obj
        '''
        assert(isinstance(obj, PushBulletObject))
        return obj.bind(self)

    @property
    def ident(self):
        '''
        For `PushTarget` interface compliance
        '''
        return {}

    @property
    def api(self):
        '''
        For `PushTarget` interface compliance only
        '''
        return self

    def stream(self, skip_nop=True, use_server_time=False, throttle=1):
        '''
        Generator to listen for events on websocket and yield them

        The method requires `websocket` library. It will run an infinite event loop, which
        fetches events from websocket and provides them as an Event objects, e.g.::

            for ev in api.stream():
                print(ev)

        To be able to run any other code at the same time, consider running the loop
        in some other (background) thread.

        :param bool skip_nop: skip "nop" events (used as keep-alive heartbeats only), default is True
        :param bool use_server_time: use server time to track last push to fetch (requires additional request on event), default is False
        :rtype: generator
        '''
        from websocket import create_connection
        conn = create_connection('wss://stream.pushbullet.com/websocket/%s' % self.apikey)
        last_ts = ((self.latest_push_time() or time.time()) if use_server_time else time.time()) + throttle

        while True:
            event = json.loads(conn.recv())
            evtype = event['type']
            if skip_nop and evtype == 'nop':
                continue

            event = (NopEvent(self) if evtype == 'nop' else
                     TickleEvent(self, event['subtype'], since=last_ts) if evtype == 'tickle' else
                     PushEvent(self, self.make_push(event['push'])) if evtype == 'push' else
                     None)

            last_ts = ((event.latest_push_time() or time.time()) if use_server_time else time.time()) + throttle

            if event:
                yield event

    def latest_push_time(self):
        try:
            push = self.pushes(limit=1).next()
            return push.get('modified') or push.get('created')
        except StopIteration:
            return None

    def __unicode__(self):
        return u'<PushBullet>'

# }}}

#import yaml
#with open('/usr/local/etc/pushbullet.yml', 'rb') as f:
#    config = yaml.safe_load(f)
#
#pb = PushBullet(config['apikey'])

