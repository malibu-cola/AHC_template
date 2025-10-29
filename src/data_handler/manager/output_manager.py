from src.data_handler.data.output_data import OutputData


def output_result(output_data: OutputData) -> None:
    """Write the solution back to stdout."""
    if not output_data.lines:
        return
    print("\n".join(output_data.lines))
