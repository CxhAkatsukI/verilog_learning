
# 数字电路 (Digital Circuits)

**课程编码**：B0911003Y-02  
**课时**：60  
**学分**：3.00  
**课程属性**：专业必修课  
**主讲教师**：李文明  

---

## 教学目的与要求
本课程是为计算机科学与技术专业本科生二年级开设的专业基础课，旨在建立学生对电路方面的基本概念、分析方法，并初步掌握复杂数字系统的设计和实现方法。通过课程学习，学生能够了解从需求分析到电路实现的整体流程，掌握使用 EDA 工具和 HDL 编程的实践技能，为后续“计算机组成原理”和“计算机系统结构”等课程建立概念基础。

### 学生需掌握以下内容：
1. 掌握数制、数码、逻辑代数。  
2. 掌握数字电路的基本概念、基本电路、基本分析方法和实验技能。  
3. 掌握组合逻辑电路的分析、设计和实现方法。  
4. 掌握同步时序电路的分析、设计和实现方法。  
5. 掌握半导体存储电路的分析、设计和实现方法。  
6. 掌握可编程逻辑器件的基本概念、基本电路和使用方法。  
7. 掌握使用硬件描述语言设计数字电路的流程和方法，具备系统设计、仿真、综合及实现的能力。

---

## 预修课程
无

---

## 主要内容
课程分为十个章节，全面系统性讲解数字电路知识。各章节重点、难点如下：

### 第一章：数字电路概览与信息编码
- **内容**：了解数字电路技术的产生与发展，掌握数制及各种字符编码。  
- **重点**：数字电路与模拟电路的区别与联系；多种字符编码的用途。  
- **难点**：数字电路各章节间的关联。  

### 第二章：数字电路逻辑运算及电路化简
- **内容**：掌握逻辑符号图、电路图、波形图及真值表之间的对应关系，熟悉电路化简方法。  
- **重点**：逻辑表示方法及化简原理。  

### 第三章：半导体门电路
- **内容**：理解半导体二极管、CMOS 门电路功能和电气特性，掌握基本门电路逻辑功能。  
- **重点**：CMOS 电路的结构与功能实现方法。  

### 第四章：硬件描述语言与 VLSI 设计
- **内容**：掌握 HDL 编程方法，了解集成电路设计流程和现状。  
- **重点**：使用 HDL 设计组合和时序逻辑电路。  

### 第五章：组合逻辑电路分析与综合方法
- **内容**：掌握编码器、译码器、加法器等模块的分析与设计；了解组合电路的竞争和冒险现象。  
- **重点**：组合电路分析与综合方法。  
- **难点**：设计复杂组合电路。  

### 第六章：触发器及其实现原理
- **内容**：理解 RS、JK、D、T 触发器工作原理及状态转换。  
- **重点**：触发器的工作原理及相互转换方法。  

### 第七章：时序逻辑电路分析与设计
- **内容**：掌握同步时序电路的分析与综合，理解寄存器、移位寄存器及计数器的工作原理。  
- **重点**：同步时序逻辑电路分析方法。  
- **难点**：设计复杂时序逻辑电路。  

### 第八章：半导体存储器
- **内容**：掌握 ROM、RAM 存储器的基本工作原理，了解存储器编址与容量扩展方法。  
- **重点**：存储器实现机制及逻辑映射关系。  

### 第九章：可编程逻辑器件
- **内容**：了解 CPLD、FPGA 的基本概念及实现方法。  
- **重点**：逻辑单元结构及复杂逻辑实现。  

### 第十章：振荡电路及数模转换电路
- **内容**：了解振荡电路实现方法及 D/A、A/D 转换原理。  

---

## 实验部分
1. **EDA 环境学习与 HDL 基础**：使用 HDL 设计简单的 4 位加法器，进行仿真与调试。  
2. **16 位加法器设计**：在 4 位加法器基础上扩展，掌握复杂组合逻辑设计。  
3. **复杂状态机设计**：实现复杂功能的状态机，进行功能验证及仿真。  
4. **FIFO 设计实验**：设计 FIFO 逻辑并验证功能正确性。

---

## 课时分配
- **授课**：52 学时  
- **实验**：8 学时  

| **章节**                     | **讲课** | **习题课** | **实验** |
|------------------------------|----------|------------|----------|
| 数字电路概览与信息编码       | 2        |            |          |
| 数字电路逻辑运算及电路化简   | 2        |            |          |
| 半导体门电路                 | 6        |            |          |
| 组合逻辑电路                 | 8        |            |          |
| 习题课                       |          | 2          |          |
| 硬件描述语言与 EDA 技术      | 4        |            |          |
| EDA 工具及 4 位加法器实验    |          |            | 2        |
| 触发器                       | 4        |            |          |
| 16 位比较器实验              |          |            | 2        |
| 时序逻辑电路                 | 8        |            |          |
| 半导体存储器                 | 2        |            |          |
| 可编程逻辑器件               | 2        |            |          |
| 振荡电路及数模转换           | 4        |            |          |
| FIFO 逻辑电路实验            |          |            | 2        |

---

## 教材
- **《数字电子技术基础》**，阎石，王红，第6版，高等教育出版社，2016年。

### 参考文献
1. **《电子技术基础(数字部分)》**，康华光，第6版，高等教育出版社，2014年。  
2. **《现代逻辑设计》**，R. Katz 和 G. Borriello，第2版，北京：电子工业出版社，2006年。  
3. **《Verilog数字系统设计教程》**，夏宇闻，韩彬，第4版，北京航空航天大学出版社，2017年。
