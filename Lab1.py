from collections import deque  # Importamos deque para manejar la cola de clientes

class Banco:
    def __init__(self):
        """
        Constructor de la clase Banco.
        Se crean dos colas:
        - cola_prioritaria: Para clientes con prioridad (ej. personas mayores, con discapacidad).
        - cola_general: Para clientes normales.
        """
        self.cola_general = deque()  # Cola para clientes normales
        self.cola_prioritaria = deque()  # Cola para clientes prioritarios

    def agregar_cliente(self, nombre, prioritario=False):
        """
        Agrega un cliente a la cola correspondiente.
        Parámetros:
        - nombre: Nombre del cliente.
        - prioritario: Booleano que indica si el cliente tiene prioridad.
        """
        if prioritario:
            self.cola_prioritaria.append(nombre)  # Agrega a la cola prioritaria
            print(f" Cliente PRIORITARIO {nombre} agregado a la cola.")
        else:
            self.cola_general.append(nombre)  # Agrega a la cola normal
            print(f" Cliente {nombre} agregado a la cola.")

    def atender_cliente(self):
        """
        Atiende al siguiente cliente en la cola.
        - Si hay clientes prioritarios, los atiende primero.
        - Si no hay prioritarios, atiende a los clientes normales.
        - Si no hay nadie en la cola, muestra un mensaje de advertencia.
        """
        if self.cola_prioritaria:
            cliente = self.cola_prioritaria.popleft()  # Atiende al primer cliente prioritario
            print(f" Atendiendo a cliente PRIORITARIO: {cliente}")
        elif self.cola_general:
            cliente = self.cola_general.popleft()  # Atiende al primer cliente normal
            print(f" Atendiendo a cliente: {cliente}")
        else:
            print(" No hay clientes en la cola.")