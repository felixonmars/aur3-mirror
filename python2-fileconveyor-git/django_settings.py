# Dummy settings for `django-storages`.
#MEDIA_URL=''
#MEDIA_ROOT=''
# `backends/ftp.py`
#FTP_STORAGE_LOCATION=''
# `backends/sftp.py`
#SFTP_STORAGE_HOST=''
# django-cumulus
CUMULUS = {};
CUMULUS['USERNAME'] = '';
CUMULUS['CUMULUS_API_KEY'] = '';
CUMULUS['CONTAINER'] = '';
CUMULUS["PYRAX_IDENTITY_TYPE"] = '';
SECRET_KEY= CUMULUS['CUMULUS_API_KEY'];
