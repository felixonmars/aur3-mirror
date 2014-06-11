# -*- encoding: utf-8 -*-
from requests import session
from os.path import basename
import datetime
import json
import time

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

    def pushes(self, skip_empty=False):
        return self.api.pushes(since=self.since, skip_empty=skip_empty)

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

# }}}

class PushBulletError(Exception):
    pass

class PushBulletObject(object):
    @property
    def uri(self):
        raise NotImplementedError

    def delete(self):
        self.api.delete(self.uri)

    def bind(self, api):
        assert(isinstance(api, PushBullet))
        self.api = api
        return self

    @property
    def bound(self):
        return bool(getattr(self, 'api', None))

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
        raise NotImplementedError

    def push(self, push=None, **pushargs):
        if not push:
            push = self.api.make_push(pushargs)

        push.send(self)
        return push

    def __unicode__(self):
        return unicode(str(self), 'utf-8')

class Contact(PushTarget):
    '''
    Contact to push to
    '''
    def __repr__(self):
        return '<Contact[%s]: %s <%s>>' % (self.iden, self.name, self.email)

    def __str__(self):
        return '%s <%s>' % (self.name, self.email)

    @property
    def ident(self):
        return {'email': self.email_normalized}

    @property
    def uri(self):
        return 'contacts/%s' % self.iden


class Device(PushTarget):
    '''
    Device to push to
    '''
    def __repr__(self):
        return '<Device[%s]: %s>' % (self.iden,
                getattr(self, 'nickname', None) or
                getattr(self, 'model', None) or
                'Unnamed')

    def __str__(self):
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

# }}}

# Pushes {{{

class Push(PushBulletObject):
    '''
    Abstract push object
    '''
    type = None
    def __init__(self, **data):
        self.__dict__.update(data)

    def send(self, target):
        if not isinstance(target, PushTarget):
            target = Device(self.api, str(target))

        data = self.data
        data.update(target.ident)
        data['type'] = self.type
        result = target.api.post('pushes', **data)
        self.bind(target.api)
        self.__dict__.update(result)
        
    @property
    def data(self):
        raise NotImplementedError

    def __eq__(self, other):
        return isinstance(other, Push) and self.iden == other.iden

    def __repr__(self):
        return '<%s[%s]: %s>' % (self.__class__.__name__, getattr(self, 'iden', None), str(self))

    def __str__(self):
        return '%s push' % getattr(self, 'type', 'general')

    @property
    def uri(self):
        return 'pushes/%s' % self.iden

class NotePush(Push):
    '''
    Note push
    '''
    type = 'note'
    def __init__(self, body, title='', **data):
        self.title, self.body = title, body
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'body': self.body}

    def __str__(self):
        return self.title

class LinkPush(Push):
    '''
    Link push
    '''
    type = 'link'
    def __init__(self, url, title='', body='', **data):
        self.title, self.url, self.body = title, url, body
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'url': self.url, 'body': self.body}

    def __str__(self):
        return self.url

class AddressPush(Push):
    '''
    Address push
    '''
    type = 'address'
    def __init__(self, address, name='', **data):
        self.name, self.address = name, address
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'name': self.name, 'address': self.address}

    def __str__(self):
        return '%s (%s)' % (self.name, self.address)

class ListPush(Push):
    '''
    List push
    '''
    type = 'list'
    def __init__(self, items, title='', **data):
        self.title, self.items = title, list(items)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'items': self.items}

    def __str__(self):
        return '%s (%d)' % (self.title, len(self.items))

class FilePush(Push):
    '''
    File push
    '''
    type = 'file'
    def __init__(self, file=None, file_name=None, file_type=None, body='', **data):
        assert(file or file_name)
        self.file, self.file_name, self.file_type = file or file_name, file_name, file_type
        self.file_url = None
        self.body = body
        Push.__init__(self, **data)

    def send(self, target):
        if not isinstance(target, PushTarget):
            target = Device(self.api, str(target))

        if not self.file_url:  # file not uploaded yet
            fh = self.file if isinstance(self.file, file) else open(self.file, 'rb')

            try:
                file_name = str(self.file_name) if self.file_name else basename(fh.name)
                file_type = str(self.file_type) if self.file_type else self.guess_type(fh)
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

    def __str__(self):
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

class PushBullet(object):
    '''
    Main API class for PushBullet
    '''

    API_URL = 'https://api.pushbullet.com/v2/%s'

    def __init__(self, apikey):
        '''
        Initialize API object (get API key from https://www.pushbullet.com/account)
        '''
        self.apikey = apikey
        self.sess = session()
        self.sess.auth = (apikey, '')

    def get_type_by_args(self, args):
        return args.get('type') or ('url' if 'url' in args else
                     'list' if 'items' in args else
                     'address' if 'address' in args else
                     'file' if 'file' in args or 'file_name' in args else
                     'note')

    def make_push(self, pushargs):
        '''
        Factory to create a push object out of raw data in dictionary
        '''
        pushcls = {
                'note': NotePush,
                'list': ListPush,
                'link': LinkPush,
                'file': FilePush,
                'address': AddressPush,
                'mirror': MirrorPush,
                'dismissal': DismissalPush,
                }.get(self.get_type_by_args(pushargs), Push)
        return pushcls(**pushargs).bind(self)

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

    __devices = None
    def devices(self, reset_cache=False):
        '''
        Get available devices to push to
        '''
        if not reset_cache and self.__devices:
            return self.__devices

        self.__devices = map(lambda d: Device(self, **d), self.get('devices')['devices'])
        return self.__devices


    def create_device(self, nickname, type='stream'):
        return Device(self, None, nickname=nickname, type=type).create()


    __contacts = None
    def contacts(self, reset_cache=False):
        '''
        Get available contacts to push to
        '''
        if not reset_cache and self.__contacts:
            return self.__contacts

        self.__contacts = map(lambda c: Contact(self, **c), self.get('contacts')['contacts'])
        return self.__contacts

    def __getitem__(self, device_iden):
        try:
            return next(d for d in self.devices() if d.iden == device_iden)
        except StopIteration:
            try:
                return next(d for d in self.devices() if str(d) == device_iden)
            except StopIteration:
                raise KeyError(device_iden)

    def pushes(self, since=0, skip_empty=True):
        '''
        Generator fetches and yields all pushes since given timestamp
        '''
        if isinstance(since, datetime.date):
            since = since.strftime('%s')
        elif isinstance(since, datetime.timedelta):
            since = (datetime.datetime.now() - since).strftime('%s')
        elif since < 0:
            since = time.time() + since

        pushes = self.get('pushes', modified_after=since)

        while True:
            for push in pushes['pushes']:
                if skip_empty and not push.get('type'):
                    continue

                yield self.make_push(push)

            if not pushes.get('cursor'):
                break

            pushes = self.get('pushes', cursor=pushes['cursor'])

    __me = None
    def me(self, reset_cache=False):
        '''
        Get current user information
        '''
        if not reset_cache and self.__me:
            return self.__me

        self.__me = self.get('users/me')
        return self.__me

    def push(self, target, push=None, **pushargs):
        '''
        Send push to a target
        '''
        if not isinstance(target, PushTarget):
            target = Device(self, str(target))

        if not push:
            push = self.make_push(pushargs)

        push.send(target)
        return push

    def bind(self, obj):
        assert(isinstance(obj, PushBulletObject))
        return obj.bind(self)

    def stream(self, skip_nop=True):
        '''
        Generator to listen for events on websocket and yield them
        '''
        from websocket import create_connection
        conn = create_connection('wss://stream.pushbullet.com/websocket/%s' % self.apikey)
        last_ts = time.time()

        while True:
            event = json.loads(conn.recv())
            evtype = event['type']
            if skip_nop and evtype == 'nop':
                continue

            event = (NopEvent(self) if evtype == 'nop' else
                     TickleEvent(self, event['subtype'], since=last_ts) if evtype == 'tickle' else
                     PushEvent(self, self.make_push(event['push'])) if evtype == 'push' else
                     None)
            last_ts = time.time()
            if event:
                yield event

# }}}

#import yaml
#with open('/usr/local/etc/pushbullet.yml', 'rb') as f:
#    config = yaml.safe_load(f)
#
#pb = PushBullet(config['apikey'])

