import numpy as np
import tensorflow as tf

mnist = tf.keras.datasets.mnist

(training_images, training_labels), _ = mnist.load_data()


def reshape_and_normalize(images):
    images = images[..., np.newaxis]
    images = images/255.0
    return images


class myCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs = {}):
        if logs.get('accuracy') is not None and logs.get('accuracy') > 0.995:
            print('\n>99.5%, paramos')
            self.model.stop_training = True


def convolutional_model():
    model = tf.keras.models.Sequential(
        [
            tf.keras.layers.Conv2D(32, (3, 3), activation = 'relu', input_shape = (28, 28, 1)),
            tf.keras.layers.MaxPooling2D(2, 2),
            tf.keras.layers.Flatten(),
            tf.keras.layers.Dense(256, activation = 'relu'),
            tf.keras.layers.Dense(10, activation = 'softmax')
        ]
    )

    model.compile(
        optimizer = 'adam',
        loss = 'sparse_categorical_crossentropy',
        metrics = ['accuracy']
    )

    return model


model = convolutional_model()

callbacks = myCallback()

history = model.fit(training_images, training_labels, epochs = 50, callbacks = [callbacks])
