defmodule Awesome do
     defp __calc(left_op, op, right_op)
        when op in '+-*/' do
            left_number = left_op |> List.to_integer
            right_number = right_op |> List.to_integer
            case op do
                ?+ -> left_number + right_number
                ?- -> left_number - right_number
                ?* -> left_number * right_number
                ?/ -> left_number / right_number
            end
    end

    defp __calc(_, op, _), do: raise "Invalid op '#{op}'"

    defp _parseLeftOp([]), do: ''
    defp _parseLeftOp([head | _]) when head == ?\s, do: ''
    defp _parseLeftOp([head | tail]), do: [head | _parseLeftOp tail]

    defp _parseOp([head | _]) when head in '+-*/', do: head
    defp _parseOp([_ | tail]), do: _parseOp(tail)

    def calculate(str) do
        leftOp = _parseLeftOp(str)
        # same parser but reverse
        rightOp = _parseLeftOp(str |> Enum.reverse) |> Enum.reverse
        op = _parseOp(str)
        
        __calc(leftOp, op, rightOp)
    end
end