from sys import stdin

from src.data_handler.data.input_data import InputData


def load_input() -> InputData:
    """Parse stdin into an InputData instance."""
    raw = stdin.read().splitlines()
    return InputData(raw_lines=raw)
