from distutils.core import setup

import shpaml

setup(
    name='shpaml',
    version=shpaml.__version__,
    description = "Light syntax layer for HTML",
        author = "Steve Howell",
        author_email = "shpaml@googlegroups.com",
        url = "http://shpaml.webfactional.com/",
        download_url = "http://shpaml.webfactional.com/source_code",
        keywords = ["shpaml", "haml", "html"],
        classifiers = [
            "Programming Language :: Python",
            "Programming Language :: Python :: 3",
            "Development Status :: 4 - Beta",
            "Environment :: Web Environment",
            "Intended Audience :: Developers",
            "License :: Freely Distributable",
            "Operating System :: OS Independent",
            "Topic :: Text Processing :: Markup :: HTML",
            ],
        long_description = """\
            SHPAML is a mini language that can help you to build web pages
            more quickly. It leverages familiar concepts from HTML and CSS,
            while striving to bring brevity and clarity to the primary
            documents that you edit. It plays nice with templating languages.

            SHPAML allows you to produce HTML with cleaner syntax, without
            introducing any other layer of abstraction. It does so in the
            following ways:

               1. Reduce punctuation
               2. Reduce the need for end tags
               3. Mimic CSS selector syntax
               4. Allow well-formed HTML to pass through
               5. Play nice with templating languages
""",
    py_modules=['shpaml'],
    scripts=['shpaml.py'],
    zip_safe=True
)
