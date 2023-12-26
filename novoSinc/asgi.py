import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from your_project.routing import application as your_project_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'novoSinc.settings')

# The Django application
django_application = get_asgi_application()

# Channels routing configuration
application = ProtocolTypeRouter({
    "http": django_application,
    """ "websocket": AuthMiddlewareStack(
        URLRouter(
            your_project_application  # Use your project's routing configuration
        )
    ), """
})