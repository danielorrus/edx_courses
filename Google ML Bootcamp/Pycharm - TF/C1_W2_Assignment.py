import tensorflow as tf

mnist = tf.keras.datasets.mnist
(x_train, y_train), _ = mnist.load_data()

x_train = x_train/255.0


class myCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs = {}):
        if logs.get('accuracy') is not None and logs.get('accuracy') > 0.99:
            print('\n99% => cancelamos')
            self.model.stop_training = True


def train_mnist(x_train, y_train):
    callbacks = myCallback()

    model = tf.keras.models.Sequential(
        [
            tf.keras.layers.Flatten(input_shape = (28, 28)),
            tf.keras.layers.Dense(256, activation = 'relu'),
            tf.keras.layers.Dense(10, activation = 'softmax')
        ]
    )

    model.compile(
        optimizer = 'adam',
        loss = 'sparse_categorical_crossentropy',
        metrics = ['accuracy']
    )

    history = model.fit(x_train, y_train, epochs = 100, callbacks = [callbacks])

    return history


hist = train_mnist(x_train, y_train)
