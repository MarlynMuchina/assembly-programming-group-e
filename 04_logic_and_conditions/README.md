# 04_logic_and_conditions

# Register Sizes and Value Ranges in Assembly (NASM 8086 / x86 / x86-64)

Registers can hold different maximum values depending on their **size** and whether the values are treated as **signed** (two’s complement) or **unsigned**.

---

## 8-bit Registers
Examples: `AL`, `BL`, `CL`, `DL`, `AH`, `BH`, etc.

- **Unsigned range**: `0 → 255`  
- **Signed range**: `-128 → +127`

---

## 16-bit Registers
Examples: `AX`, `BX`, `CX`, `DX`

- **Unsigned range**: `0 → 65,535`  
- **Signed range**: `-32,768 → +32,767`

---

## 32-bit Registers
Examples: `EAX`, `EBX`, `ECX`, `EDX`

- **Unsigned range**: `0 → 4,294,967,295`  
- **Signed range**: `-2,147,483,648 → +2,147,483,647`

---

## 64-bit Registers
Examples: `RAX`, `RBX`, `RCX`, `RDX`

- **Unsigned range**: `0 → 18,446,744,073,709,551,615`  
- **Signed range**: `-9,223,372,036,854,775,808 → +9,223,372,036,854,775,807`

---

## Notes
- Registers themselves **do not know** whether values are signed or unsigned.  
  It depends on how the bits are interpreted.  

  Example:  
  - `AL = 0xFF`  
    - As unsigned → `255`  
    - As signed (two’s complement) → `-1`

- Some instructions assume **unsigned interpretation** (e.g., `DIV`), while others assume **signed interpretation** (e.g., `IDIV`).  

---

## Quick Reference Table

| Register Size | Unsigned Range | Signed Range |
|---------------|----------------|--------------|
| **8-bit**     | 0 → 255        | -128 → 127   |
| **16-bit**    | 0 → 65,535     | -32,768 → 32,767 |
| **32-bit**    | 0 → 4,294,967,295 | -2,147,483,648 → 2,147,483,647 |
| **64-bit**    | 0 → 18,446,744,073,709,551,615 | -9,223,372,036,854,775,808 → 9,223,372,036,854,775,807 |

---
