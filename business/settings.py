"""
Django settings for business project.

Generated by 'django-admin startproject' using Django 5.0.2.

For more information on this file, see
https://docs.djangoproject.com/en/5.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.0/ref/settings/
"""

from pathlib import Path
import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "rakhmatullaev-8w50pp2yu21t(!-!c#tz#+-%txm@k66rbu*uwj@@38-alnx5wd"

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    "daphne",
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    # other
    "uzrent",
    "django.contrib.humanize",
    "location_field.apps.DefaultConfig",
    "channels",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

ROOT_URLCONF = "business.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": ["templates"],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

ASGI_APPLICATION = "business.asgi.application"

WSGI_APPLICATION = "business.wsgi.application"

# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

# -- for postgresql
# DB_NAME = "uzrent"
# DB_USER = "abdu"
# DB_PASSWORD = "1528"
# DATABASES = {
#     "default": {
#         "ENGINE": "django.db.backends.postgresql_psycopg2",
#         "NAME": DB_NAME,
#         "USER": DB_USER,
#         "PASSWORD": DB_PASSWORD,
#         "HOST": "localhost",
#         "PORT": "5432",
#     }
# }

# -- for sqlite
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": BASE_DIR / "db.sqlite3",
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "Asia/Tashkent"

USE_I18N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = "/static/"
STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, "static"),
]

LOGIN_REDIRECT_URL = "/home"
LOGIN_URL = "signin"

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

MEDIA_URL = "/media/"
MEDIA_ROOT = os.path.join(BASE_DIR, "media")

LOCATION_FIELD = {
    "provider.google.api": "//maps.google.com/maps/api/js?sensor=false",
    "provider.google.api_key": "AIzaSyDS9_Y7Qvl42SqUgh9LwlZOu26Ys2hKAzc",
    "provider.google.api_libraries": "",
    "provider.google.map.type": "ROADMAP",
}

CHANNEL_LAYERS = {"default": {"BACKEND": "channels.layers.InMemoryChannelLayer"}}
# GDAL_LIBRARY_PATH = "/opt/homebrew/bin/gdalinfo"
# GEOS_LIBRARY_PATH = '/opt/homebrew/Cellar/geos/3.12.1/lib/libgeos_c.dylib'