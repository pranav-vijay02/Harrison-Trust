import tkinter as tk
from tkinter import ttk,messagebox
import mysql.connector as mycon
from tkcalendar import DateEntry
from datetime import date
import hashlib
import hmac


BG = '#101B2D'
PANEL = '#1B2B40'
SECONDARY = '#263B52'
ACCENT = '#E63946'
TEXT = '#F1F5F9'
MUTED = '#91A4B7'
WHITE = '#FFFFFF'

db = mycon.connect(
    host='localhost',
    user='root',
    password='iamironman',
    database='harrisontrust'
)
cur = db.cursor()

root = tk.Tk()
root.title('Harrison Trust')
root.geometry('1000x500')
root.minsize(1000,500)
root.iconbitmap('harrison_icon.ico')

style = ttk.Style()
style.theme_use('clam')


style.configure('TFrame',background=BG)

style.configure('TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',11))

style.configure('TButton',background=SECONDARY,
                foreground=TEXT,font=('Segoe UI',11,'bold'),
                padding=(12,8),borderwidth=0)

style.map('TButton',
          background=[('active',ACCENT),('pressed',ACCENT)],
          foreground=[('active',WHITE)])

style.configure('TEntry',fieldbackground=PANEL,
                foreground=TEXT,insertcolor=WHITE,
                padding=7)

style.configure('TCombobox',fieldbackground=PANEL,
                background=SECONDARY,foreground=TEXT,
                padding=7)

style.configure('Treeview', background=PANEL,
                foreground=TEXT,fieldbackground=PANEL,
                rowheight=30,font=('Segoe UI',10))

style.configure('Treeview.Heading',background=SECONDARY,
                foreground=WHITE,font=('Segoe UI',10,'bold'),
                padding=8)

style.map('Treeview',
          background=[('selected',ACCENT)],
          foreground=[('selected',WHITE)])

style.configure('Home.TFrame',background=BG)

style.configure('Title.TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',42,'bold'))

style.configure('Subtitle.TLabel',background=BG,
                foreground=MUTED,font=('Segoe UI',12))

style.configure('Home.TButton',font=('Segoe UI',12,'bold'),
                background=SECONDARY,foreground=TEXT,
                padding=(25,15),borderwidth=0)

style.map('Home.TButton',background=[('active',ACCENT)],
          foreground=[('active','white')])

style.configure('Admin.TButton',font=('Segoe UI',10,'bold'),
                background=PANEL,foreground=TEXT,
                padding=(15,8),borderwidth=0)

style.map('Admin.TButton',background=[('active',SECONDARY)],
          foreground=[('active',TEXT)])


style.configure('Register.TFrame',background=BG)

style.configure('RegisterTitle.TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',24,'bold'))

style.configure('RegisterHeading.TLabel',background=BG,
                foreground=ACCENT,font=('Segoe UI',13,'bold'))

style.configure('Register.TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',10))

style.configure('Register.TEntry',fieldbackground=PANEL,
                foreground=TEXT,insertcolor=WHITE,
                padding=7)

style.configure('Register.TCombobox',fieldbackground=PANEL,
                background=SECONDARY,foreground=TEXT,
                padding=7)

style.map('Register.TCombobox',
          fieldbackground=[('readonly',PANEL)],
          foreground=[('readonly',TEXT)])

style.configure('Register.TSpinbox',fieldbackground=PANEL,
                foreground=TEXT,arrowcolor=TEXT,
                padding=7)

style.configure('Register.TButton',font=('Segoe UI',10,'bold'),
                background=SECONDARY,foreground=TEXT,
                padding=(12,8),borderwidth=0)

style.map('Register.TButton',
          background=[('active',ACCENT)],
          foreground=[('active',WHITE)])


style.configure('Login.TFrame',background=BG)

style.configure('LoginTitle.TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',10))

style.configure('Login.TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',11,'bold'))

style.configure('Login.TEntry',fieldbackground=PANEL,
                foreground=TEXT,insertcolor=TEXT,
                padding=10,borderwidth=1)

style.configure('Login.TButton',
                font=('Segoe UI',11,'bold'),
                background=ACCENT,foreground='white',
                padding=(15,10),borderwidth=0)

style.map('Login.TButton',background=[('active','#C92F3B')])

style.configure('Back.TButton',font=('Segoe UI',10),
                background=BG,foreground=MUTED,
                padding=8,borderwidth=0)

style.map('Back.TButton',foreground=[('active',TEXT)])

style.configure('Login.TCheckbutton',
                background=BG,foreground=TEXT,
                font=('Segoe UI',10))

style.map('Login.TCheckbutton',
          background=[('active',BG)],
          foreground=[('active',WHITE)])

style.configure('Admin.TFrame',background=BG)

style.configure('AdminTitle.TLabel',background=BG,
                foreground=TEXT,font=('Segoe UI',28,'bold'))

style.configure('Admin.TButton',font=('Segoe UI',12,'bold'),
                background=SECONDARY,foreground=TEXT,
                padding=(20,14),borderwidth=0)

style.map('Admin.TButton',
          background=[('active',ACCENT)],
          foreground=[('active',WHITE)])

style.configure('AdminLogout.TButton',font=('Segoe UI',10,'bold'),
                background=PANEL,foreground=MUTED,
                padding=(12,8),borderwidth=0)

style.map('AdminLogout.TButton',
          background=[('active',ACCENT)],
          foreground=[('active',WHITE)])

style.configure('Records.Treeview',
                background=PANEL,
                foreground=TEXT,
                fieldbackground=PANEL,
                rowheight=32,
                font=('Segoe UI',10))

style.configure('Records.Treeview.Heading',
                background=SECONDARY,
                foreground=TEXT,
                font=('Segoe UI',10,'bold'),
                padding=8,
                relief='flat')

style.map('Records.Treeview',
          background=[('selected',ACCENT)],
          foreground=[('selected',WHITE)])

style.map('Records.Treeview.Heading',
          background=[('active',ACCENT)],
          foreground=[('active',WHITE)])

container = ttk.Frame(root)
container.pack(fill='both',expand=True)
container.rowconfigure(0,weight=1)
container.columnconfigure(0,weight=1)

home_frame = ttk.Frame(container,style='Home.TFrame')
regs_frame = ttk.Frame(container,style='Register.TFrame')
login_frame = ttk.Frame(container,style='Login.TFrame')
admin_frame = ttk.Frame(container,style='Admin.TFrame')

home_frame.grid(row=0,column=0,sticky='nsew')
regs_frame.grid(row=0,column=0,sticky='nsew')
login_frame.grid(row=0,column=0,sticky='nsew')
admin_frame.grid(row=0,column=0,sticky='nsew')
home_frame.tkraise()


def register_donor():

    donor_name = name.get()
    donor_age = age_int.get()
    donor_dob = dob_ent.get_date()
    donor_gender = gender_str.get()
    donor_blood = blood_str.get()
    donor_phone = phone_num.get()
    donor_city = city.get()

    donor_weight = weight_val.get()
    donor_hemo = hemo_val.get()
    donor_sysbp = sys_bp_val.get()
    donor_diasbp = dias_bp_val.get()

    donor_lastDon = last_don_ent.get_date()

    donor_disease = disease_hist.get()
    donor_medic = medication.get()

    def clear_donor_form():
        name.set("")
        age_int.set(0)
        gender_str.set("")
        blood_str.set("")
        phone_num.set("")
        city.set("")
        weight_val.set(0)
        hemo_val.set(0)
        sys_bp_val.set(0)
        dias_bp_val.set(0)
        disease_hist.set(False)
        medication.set(False)
        dob_ent.set_date(date.today())
        last_don_ent.set_date(date.today())

    today = date.today()

    if donor_dob > today:
        messagebox.showerror(
            "Invalid DOB",
            "Date of birth cannot be in the future."
        )
        return

    calc_age = today.year - donor_dob.year
    if (today.month,today.day) < (donor_dob.month,donor_dob.day):
        calc_age -= 1

    if not donor_phone.isdigit() or len(donor_phone) != 10:
        messagebox.showerror(
            "Invalid Phone Number",
            "Enter a valid 10-digit phone number.")
        return

    def eligible(donor_name, donor_age, calc_age, donor_gender, donor_blood,
             donor_city, donor_weight, donor_hemo, donor_sysbp,
             donor_diasbp, donor_lastDon, donor_disease, donor_medic):

        reasons = []
        if not donor_name.strip():
            reasons.append("Name is required.")

        if donor_age != calc_age:
            reasons.append("Entered age does not match the date of birth.")

        if calc_age < 18:
            reasons.append("Donor must be at least 18 years old.")

        if calc_age > 65:
            reasons.append("Donor must not be older than 65 years.")

        if not donor_gender:
            reasons.append("Gender must be selected.")

        if not donor_blood:
            reasons.append("Blood group must be selected.")

        if not donor_city.strip():
            reasons.append("City is required.")

        if donor_weight < 45:
            reasons.append("Weight must be at least 45 kg.")

        if donor_hemo < 12.5:
            reasons.append("Haemoglobin must be at least 12.5 g/dL.")

        if donor_sysbp < 100 or donor_sysbp > 140:
            reasons.append("Systolic BP must be between 100 and 140 mmHg.")

        if donor_diasbp < 60 or donor_diasbp > 90:
            reasons.append("Diastolic BP must be between 60 and 90 mmHg.")

        today = date.today()
        if donor_lastDon > today:
            reasons.append("Last donation date cannot be in the future.")

        else:
            days_since_donation = (today - donor_lastDon).days

            if donor_gender == "Male":
                required_gap = 90

            elif donor_gender == "Female":
                required_gap = 120

            else:
                required_gap = 120

            if days_since_donation < required_gap:
                reasons.append(
                    f"At least {required_gap} days must have passed since "
                    "the last donation.")

        if donor_disease:
            reasons.append("Donor has a reported disease history.")

        if donor_medic:
            reasons.append("Donor is currently taking medication.")

        if reasons:
            return False, reasons

        return True, []

    is_eligible,reasons = eligible( donor_name,
                            donor_age,calc_age,
                            donor_gender,donor_blood,
                            donor_city,donor_weight,
                            donor_hemo,donor_sysbp,
                            donor_diasbp,donor_lastDon,
                            donor_disease,donor_medic)

    if not is_eligible:
        messagebox.showerror(
        "Donor Not Eligible",
        "The donor cannot be registered for the following reason(s):\n\n"
        + "\n".join("-> " + reason for reason in reasons))
        return

    messagebox.showinfo(
        'Eligible',
        'Donor has passed the eligibility checks')

    cur.execute("""
    SELECT Donor_ID
    FROM donors_general
    WHERE Phone = %s""",
    (donor_phone,))
    
    if cur.fetchone():
        messagebox.showerror(
        "Duplicate Phone Number",
        "This phone number is already registered.")
        return

    query1 = '''
        INSERT INTO donors_general
        (Donor_Name,Age,DOB,Gender,Blood_Group,Phone,City)
        VALUES(%s,%s,%s,%s,%s,%s,%s)'''
    data_dgen = (donor_name,donor_age,
            donor_dob,donor_gender,
            donor_blood,donor_phone,
            donor_city)
    query2 = '''
        INSERT INTO donors_medical
        VALUES (%s, %s, %s, %s, %s, %s)'''
    
    try:
        cur.execute(query1, data_dgen)
        donor_id = cur.lastrowid
        data_dmed = (donor_id, donor_hemo,
                    donor_weight, donor_sysbp,
                    donor_diasbp, donor_lastDon,)
        cur.execute(query2, data_dmed)
        db.commit()

    except mycon.Error as err:
        db.rollback()
        messagebox.showerror(
            "Database Error",
            f"Donor registration failed.\n\n{err}"
        )
        return

    clear_donor_form()

    messagebox.showinfo(
        'Registration Successful',
        f'Donor registered successfully.\nDonor ID: {donor_id}')

def register_recp():
    global r_phone

    r_name = recp_name.get()
    r_age = recp_age.get()
    r_dob = recp_dob_ent.get_date()
    r_gender = recp_gender.get()
    r_blood = recp_blood.get()
    r_phone = recp_phone.get()

    r_condition = recp_condition.get()
    r_urgency = recp_urgency.get()
    r_units = recp_units.get()

    def clear_recp_form():
        recp_name.set("")
        recp_age.set(0)
        recp_gender.set("")
        recp_blood.set("")
        recp_phone.set("")
        recp_condition.set("")
        recp_urgency.set("")
        recp_units.set(0)
        recp_dob_ent.set_date(date.today())

    today = date.today()

    calc_age = today.year - r_dob.year
    if (today.month,today.day) < (r_dob.month,r_dob.day):
            calc_age -= 1

    if r_dob > today:
        messagebox.showerror(
            "Invalid DOB",
            "Date of birth cannot be in the future.")
        return
    
    if calc_age != r_age:
        messagebox.showerror(
            'Age Not Matched',
            'Entered age does not match date of birth.')
        return
    
    if not r_phone.isdigit() or len(r_phone) != 10:
        messagebox.showerror(
            "Invalid Phone Number",
            "Enter a valid 10-digit phone number.")
        return

    if r_units <= 0:
        messagebox.showerror(
            "Invalid Units",
            "Units required must be greater than 0.")
        return

    def empty(r_name,r_gender,r_blood,r_condition,r_urgency):
        reasons = []
        if not r_name.strip():
            reasons.append("Name is required.")
        if not r_gender:
            reasons.append("Gender must be selected.")
        if not r_blood:
            reasons.append("Blood group must be selected.")
        if not r_condition:
            reasons.append('Condition must be selected.')
        if not r_urgency:
            reasons.append('Urgency must be selected.')


        if reasons:
            return False,reasons

        return True, []

    is_empty,reasons = empty(r_name,r_gender,r_blood,r_condition,r_urgency)
    if not is_empty:
       messagebox.showerror(
              "Form Incomplete",
              "The recipient cannot be registered for the following reason(s):\n\n"
              + "\n".join("-> " + reason for reason in reasons))
       return

    cur.execute("""
    SELECT Donor_ID
    FROM donors_general
    WHERE Phone = %s
""", (r_phone,))
    
    if cur.fetchone():
        messagebox.showerror(
        "Duplicate Phone Number",
        "This phone number is already registered.")
        return
    
    cur.execute("""
    SELECT Recipient_ID
    FROM recipients_general
    WHERE Phone = %s""", 
    (r_phone,))
    
    if cur.fetchone():
        messagebox.showerror(
        "Duplicate Phone Number",
        "This phone number is already registered.")
        return

    query1 = '''
        INSERT INTO recipients_general
        (Recipient_Name,Age,DOB,Gender,Blood_Group,Phone)
        VALUES(%s,%s,%s,%s,%s,%s)'''
    data_rgen = (r_name,r_age,
                 r_dob,r_gender,
                 r_blood,r_phone)
    query2 = '''
        INSERT INTO recipients_medical
        VALUES(%s,%s,%s,%s)'''
   
    try:
        cur.execute(query1,data_rgen)
        recp_id = cur.lastrowid
        data_rmed = (recp_id,r_condition,
                    r_urgency,r_units)
        cur.execute(query2,data_rmed)
        db.commit()

    except mycon.Error as err:
         db.rollback()
         messagebox.showerror(
            "Database Error",
            f"Recipient registration failed.\n\n{err}")
         return

    clear_recp_form()
        
    messagebox.showinfo(
        'Registration Successful',
        f'Recipient registered successfully.\nRecipient ID: {recp_id}')


def grid6x6(frame):
    for i in range(6):
        frame.rowconfigure(i,weight=1)
        frame.columnconfigure(i,weight=1)

def open_donor_regs():
    global name, age_int, dob, dob_ent, gender_str, blood_str
    global phone_num, city, weight_val, hemo_val
    global sys_bp_val, dias_bp_val, last_don_ent
    global disease_hist, medication, donor_subframe, recp_subframe

    if 'recp_subframe' in globals() and recp_subframe.winfo_exists():
        recp_subframe.destroy()

    if 'donor_subframe' in globals() and donor_subframe.winfo_exists():
        donor_subframe.destroy()

    donor_subframe = ttk.Frame(
        regs_frame,borderwidth=3,
        relief='solid',style='Register.TFrame')
    donor_subframe.grid(
        row=1,column=3,rowspan=5,
        columnspan=3,sticky='news',
        padx=10,pady=10)

    donor_subframe.columnconfigure((0,2,4),weight=1)
    donor_subframe.columnconfigure((1,3,5),weight=2)

    donor_subframe.rowconfigure(0,weight=2)
    donor_subframe.rowconfigure((1,2,3,4,5),weight=1)
    donor_subframe.rowconfigure(6,weight=2)


    d_header = ttk.Label(
        donor_subframe,
        text='Donor Registration',
        anchor='center',
        style='RegisterTitle.TLabel')

    d_header.grid(
        row=0,column=0,
        columnspan=6,sticky='nsew')


    name_label = ttk.Label(
        donor_subframe,
        text='Name',style='Register.TLabel')
    name_label.grid(
        row=1,column=0,sticky='e',
        padx=5,pady=5)

    name = tk.StringVar()
    name_ent = ttk.Entry(donor_subframe,style='Register.TEntry',
                         textvariable = name)
    name_ent.grid(row=1,column=1,sticky='ew',
                  padx=5,pady=5)


    gender_label = ttk.Label(
        donor_subframe,
        text='Gender',style='Register.TLabel')
    gender_label.grid(
        row=1,column=2,
        sticky='e',padx=5,pady=5)
    
    genders = ('Male', 'Female', 'Other')
    gender_str = tk.StringVar()
    gender_box = ttk.Combobox(
        donor_subframe,
        textvariable=gender_str,
        values=genders,
        state='readonly',style='Register.TCombobox')
    gender_box.grid(
        row=1,column=3,sticky='ew',
        padx=5,pady=5)


    blood_label = ttk.Label(
        donor_subframe,
        text='Blood Group',style='Register.TLabel')
    blood_label.grid(
        row=1,column=4,sticky='e',
        padx=5,pady=5)

    blood_groups = ('A+','A-',
                    'B+','B-',
                    'AB+','AB-',
                    'O+','O-')
    blood_str = tk.StringVar()
    blood_box = ttk.Combobox(
      donor_subframe,
      textvariable=blood_str,
      values=blood_groups,
      state='readonly',style='Register.TCombobox')
    blood_box.grid(
        row=1,column=5,sticky='ew',
        padx=5,pady=5)


    age_label = ttk.Label(
        donor_subframe,
        text='Age',style='Register.TLabel')
    age_label.grid(
       row=2,column=0,sticky='e',
       padx=5,pady=5)

    age_int = tk.IntVar()
    age_box = ttk.Spinbox(
        donor_subframe,from_=18,
        to=122,textvariable=age_int,style='Register.TSpinbox')
    age_box.grid(
        row=2,column=1,sticky='ew',
        padx=5,pady=5)


    dob_label = ttk.Label(
        donor_subframe,
        text='DOB',style='Register.TLabel')
    dob_label.grid(
        row=2,column=2,sticky='e',
        padx=5,pady=5)

    dob = tk.StringVar()
    dob_ent = DateEntry(
        donor_subframe,
        date_pattern='yyyy/mm/dd',
        textvariable=dob,style='Register.TEntry')
    dob_ent.grid(
        row=2,column=3,sticky='ew',
        padx=5,pady=5)


    def validate_phone(value):
        return value == "" or (value.isdigit() and len(value) <= 10)
    phone_validation = root.register(validate_phone)

    phone_label = ttk.Label(
        donor_subframe,
        text='Phone',style='Register.TLabel')
    phone_label.grid(
        row=4,column=0,sticky='e',
        padx=5,pady=5)

    phone_num = tk.StringVar()
    phone_ent = ttk.Entry(
        donor_subframe,
        validate='key',
        validatecommand=(phone_validation,'%P'),
        textvariable=phone_num,style='Register.TEntry')
    phone_ent.grid(
        row=4,column=1,sticky='ew',
        padx=5,pady=5)


    city_label = ttk.Label(
        donor_subframe,
        text='City',style='Register.TLabel')
    city_label.grid(
        row=3,column=0,sticky='e',
        padx=5,pady=5)
    
    city = tk.StringVar()
    city_ent = ttk.Entry(
        donor_subframe,
        textvariable=city,style='Register.TEntry')
    city_ent.grid(
        row=3,column=1,sticky='ew',
        padx=5,pady=5)


    weight_label = ttk.Label(
        donor_subframe,
        text='Weight (kg)',style='Register.TLabel')
    weight_label.grid(
        row=4,column=2,sticky='e',
        padx=5,pady=5)

    weight_val = tk.DoubleVar()
    weight_box = ttk.Spinbox(
        donor_subframe,
        from_=35.0,
        to=200.0,
        increment=0.1,
        textvariable=weight_val,style='Register.TSpinbox')

    weight_box.grid(
        row=4,column=3,sticky='ew',
        padx=5,pady=5)


    last_don_label = ttk.Label(
        donor_subframe,
        text='Last Donation',style='Register.TLabel')
    last_don_label.grid(
        row=3,column=2,sticky='e',
        padx=5,pady=5)

    last_donated = tk.StringVar()
    last_don_ent = DateEntry(
        donor_subframe,
        date_pattern='yyyy/mm/dd',
        textvariable=last_donated,style='Register.TEntry')
    last_don_ent.grid(
        row=3,column=3,sticky='ew',
        padx=5,pady=5)


    hemo_label = ttk.Label(
        donor_subframe,
        text='Haemoglobin',style='Register.TLabel')
    hemo_label.grid(
        row=2,column=4,sticky='e',
        padx=5,pady=5)

    hemo_val = tk.DoubleVar()
    hemo_box = ttk.Spinbox(
        donor_subframe,
        from_=10.0,
        to=26.0,
        increment=0.1,
        textvariable=hemo_val,style='Register.TSpinbox')
    hemo_box.grid(
        row=2,column=5,sticky='ew',
        padx=5,pady=5)


    sysbp_label = ttk.Label(
        donor_subframe,
        text='Systolic BP',style='Register.TLabel')
    sysbp_label.grid(
        row=3,column=4,sticky='e',
        padx=5,pady=5)

    sys_bp_val = tk.IntVar()
    sysbp_box = ttk.Spinbox(
        donor_subframe,
        from_=50,
        to=300,
        textvariable=sys_bp_val,style='Register.TSpinbox')
    sysbp_box.grid(
        row=3,column=5,sticky='ew',
        padx=5,pady=5)


    disease_hist = tk.BooleanVar()
    disease_check = ttk.Checkbutton(
        donor_subframe,
        text='Existing Disease History',
        variable=disease_hist)
    disease_check.grid(
        row=5,column=4,columnspan=2,
        sticky='w',padx=5,pady=5)


    medication = tk.BooleanVar()
    medic_check = ttk.Checkbutton(
        donor_subframe,
        text='Existing Medications',
        variable=medication)
    medic_check.grid(
        row=5,column=1,columnspan=2,
        sticky='w',padx=5,pady=5)


    diasbp_label = ttk.Label(
        donor_subframe,
        text='Diastolic BP',style='Register.TLabel')
    diasbp_label.grid(
        row=4,column=4,sticky='e',
        padx=5,pady=5)
    
    dias_bp_val = tk.IntVar()
    dias_bp_box = ttk.Spinbox(
        donor_subframe,
        from_=30,
        to=200,
        textvariable=dias_bp_val,style='Register.TSpinbox')
    dias_bp_box.grid(
        row=4,column=5,sticky='ew',
        padx=5,pady=5)

    submit_btn = ttk.Button(
        donor_subframe,
        text='Submit',
        command=register_donor,style='Register.TButton')
    submit_btn.grid(
        row=6,column=2,
        columnspan=2,pady=15)


def open_recp_regs():
    global recp_subframe, donor_subframe
    global recp_name, recp_age, recp_dob, recp_dob_ent
    global recp_gender, recp_blood, recp_phone
    global recp_condition, recp_urgency, recp_units

    if 'donor_subframe' in globals() and donor_subframe.winfo_exists():
        donor_subframe.destroy()

    if 'recp_subframe' in globals() and recp_subframe.winfo_exists():
        recp_subframe.destroy()

    recp_subframe = ttk.Frame(regs_frame, borderwidth=3, relief='solid',
                              style='Register.TFrame')
    recp_subframe.grid(row=1, column=3, rowspan=5, columnspan=3,
                       sticky='news', padx=10, pady=10)

    recp_subframe.columnconfigure((0, 2, 4), weight=1)
    recp_subframe.columnconfigure((1, 3, 5), weight=2)
    recp_subframe.rowconfigure(0, weight=2)
    recp_subframe.rowconfigure((1, 2, 3), weight=1)
    recp_subframe.rowconfigure(4, weight=2)

    r_header = ttk.Label(recp_subframe, text='Recipient Registration',
                         anchor='center',style='RegisterTitle.TLabel')
    r_header.grid(row=0, column=0, columnspan=6, sticky='nsew')

    ttk.Label(recp_subframe, text='Name',style='Register.TLabel').grid(
        row=1, column=0, sticky='e', padx=5, pady=5)
    recp_name = tk.StringVar()
    ttk.Entry(recp_subframe, textvariable=recp_name,style='Register.TEntry').grid(
        row=1, column=1, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Gender',style='Register.TLabel').grid(
        row=1, column=2, sticky='e', padx=5, pady=5)
    recp_gender = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_gender,
                 values=('Male', 'Female', 'Other'),
                 state='readonly',style='Register.TCombobox').grid(
        row=1, column=3, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Blood Group',style='Register.TLabel').grid(
        row=1, column=4, sticky='e', padx=5, pady=5)
    recp_blood = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_blood,
                 values=('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'),
                 state='readonly',style='Register.TCombobox').grid(
        row=1, column=5, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Age',style='Register.TLabel').grid(
        row=2, column=0, sticky='e', padx=5, pady=5)
    recp_age = tk.IntVar(value=0)
    ttk.Spinbox(recp_subframe, from_=0, to=122,
                textvariable=recp_age,style='Register.TSpinbox').grid(
        row=2, column=1, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='DOB',style='Register.TLabel').grid(
        row=2, column=2, sticky='e', padx=5, pady=5)
    recp_dob = tk.StringVar()
    recp_dob_ent = DateEntry(recp_subframe, date_pattern='yyyy/mm/dd',
                             textvariable=recp_dob,style='Register.TEntry')
    recp_dob_ent.grid(row=2, column=3, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Phone',style='Register.TLabel').grid(
        row=2, column=4, sticky='e', padx=5, pady=5)

    def validate_recipient_phone(value):
        return value == "" or (value.isdigit() and len(value) <= 10)

    recipient_phone_validation = root.register(validate_recipient_phone)
    recp_phone = tk.StringVar()
    ttk.Entry(
        recp_subframe,
        validate='key',
        validatecommand=(recipient_phone_validation, '%P'),
        textvariable=recp_phone,
        style='Register.TEntry'
    ).grid(row=2, column=5, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Condition',style='Register.TLabel').grid(
        row=3, column=0, sticky='e', padx=5, pady=5)
    recp_condition = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_condition,
                 values=('Critical', 'Normal'),
                 state='readonly',style='Register.TCombobox').grid(
        row=3, column=1, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Urgency',style='Register.TLabel').grid(
        row=3, column=2, sticky='e', padx=5, pady=5)
    recp_urgency = tk.StringVar()
    ttk.Combobox(recp_subframe, textvariable=recp_urgency,
                 values=('High', 'Medium', 'Low'),
                 state='readonly',style='Register.TCombobox').grid(
        row=3, column=3, sticky='ew', padx=5, pady=5)

    ttk.Label(recp_subframe, text='Units Required',style='Register.TLabel').grid(
        row=3, column=4, sticky='e', padx=5, pady=5)
    recp_units = tk.IntVar(value=1)
    ttk.Spinbox(recp_subframe, from_=1, to=99999999999,
                textvariable=recp_units,style='Register.TSpinbox').grid(
        row=3, column=5, sticky='ew', padx=5, pady=5)

    submit_btn = ttk.Button(
        recp_subframe,
        text='Submit',
        command=register_recp,style='Register.TButton')
    submit_btn.grid(
        row=4,column=2,
        columnspan=2,pady=15)

admin_logged_in = False

def login_admin():
    global admin_logged_in
    username = user_var.get().strip()
    password = pass_var.get()

    if not username or not password:
        messagebox.showerror(
            'Login Failed',
            'Enter username and password.'
        )
        return

    cur.execute("""
        SELECT Password_Salt, Password_Hash
        FROM admin_users
        WHERE Username = %s
    """, (username,))

    result = cur.fetchone()

    if result is None:
        messagebox.showerror(
            'Login Failed',
            'Invalid username or password.'
        )
        pass_var.set('')
        return

    salt, stored_hash = result

    entered_hash = hashlib.pbkdf2_hmac(
        'sha256',
        password.encode(),
        bytes.fromhex(salt),
        200000
    ).hex()

    if hmac.compare_digest(entered_hash, stored_hash):
        admin_logged_in = True
        pass_var.set('')
        admin_frame.tkraise()
        admin_dash_frame.tkraise()
    else:
        messagebox.showerror(
            'Login Failed',
            'Invalid username or password.'
        )
        pass_var.set('')


def logout_admin():
    global admin_logged_in
    admin_logged_in = False
    user_var.set("")
    pass_var.set("")

    home_frame.tkraise()

show_password = tk.BooleanVar(value=False)
def toggle_passwd():
    if show_password.get():
        password_ent.config(show='')
    else:
        password_ent.config(show='*')

def load_blood_overview():

    for item in blood_tree.get_children():
        blood_tree.delete(item)

    donor_counts = {'A+':0,'A-':0,'B+':0,'B-':0,
                    'AB+':0,'AB-':0,'O+':0,'O-':0}

    recipient_counts = {'A+':0,'A-':0,'B+':0,'B-':0,
                        'AB+':0,'AB-':0,'O+':0,'O-':0}

    units_required = {'A+':0,'A-':0,'B+':0,'B-':0,
                      'AB+':0,'AB-':0,'O+':0,'O-':0}

    cur.execute("""
    SELECT Blood_Group, COUNT(*)
    FROM donors_general
    GROUP BY Blood_Group
    """)

    for blood_group,total in cur.fetchall():
        donor_counts[blood_group] = total

    cur.execute("""
                SELECT g.Blood_Group, COUNT(*), SUM(m.Units_Reqd) 
                FROM recipients_general g 
                NATURAL JOIN recipients_medical m 
                GROUP BY g.Blood_Group""")

    for blood_group,total,units in cur.fetchall():
        recipient_counts[blood_group] = total
        units_required[blood_group] = units

    for blood_group in donor_counts:
        blood_tree.insert(
            '', 'end',
            values=(blood_group,
                    donor_counts[blood_group],
                    recipient_counts[blood_group],
                    units_required[blood_group]))


def open_blood_overview():

    if not admin_logged_in:
        return

    load_blood_overview()
    blood_inv_frame.tkraise()

grid6x6(home_frame)
home_title = ttk.Label(
    home_frame,
    text='Harrison Trust',
    font=('Impact',96,'bold'),
    anchor='center',style='Title.TLabel')

home_title.grid(
    row=0,column=0,columnspan=6,
    sticky='nswe',pady=20)

regs_btn = ttk.Button(
    home_frame,
    text='Registration',style='Home.TButton',
    command= lambda: regs_frame.tkraise())

regs_btn.grid(
    row=2,column=2,rowspan=2,
    sticky='nsew',padx=20,pady=10)

admin_btn = ttk.Button(
    home_frame,
    text='Admin',style='Admin.TButton',
    command=lambda: login_frame.tkraise())

admin_btn.grid(
    row=2,column=3,rowspan=2,
    sticky='nsew',padx=20,pady=10)

grid6x6(regs_frame)
back_btn = ttk.Button(
    regs_frame,
    text='Back',
    command=lambda:home_frame.tkraise())
back_btn.place(x=50,y=50)

donor_btn = ttk.Button(
    regs_frame,
    text='Donor Registration',
    command=open_donor_regs)
donor_btn.grid(row=2,column=1,
               sticky='news',padx=10,pady=10)

recp_btn = ttk.Button(
    regs_frame,
    text='Recepient Registration',
    command=open_recp_regs)
recp_btn.grid(row=3,column=1,
              sticky='news',padx=10,pady=10)


back_btn = ttk.Button(login_frame,text='Back',style='Back.TButton',
                      command=lambda: home_frame.tkraise())
back_btn.place(x=50, y=50)
grid6x6(login_frame)
login_subframe = ttk.Frame(login_frame,borderwidth=5,
                           relief='solid')
login_subframe.grid(row=1, column=1,
                    rowspan=4, columnspan=4,
                    sticky='nsew', padx=40, pady=30)

grid6x6(login_subframe)
l_header = ttk.Label(login_subframe,text='Sign in',
                     font=('Calibri', 42, 'bold'),
                     anchor='center',style='LoginTitle.TLabel')
l_header.grid(row=1, column=0,
              columnspan=6, sticky='ew')

user_var = tk.StringVar()
user_label = ttk.Label(login_subframe,text='Username',style='Login.TLabel')
user_label.grid(row=2, column=1, sticky='ew',padx=10)

username_ent = ttk.Entry(login_subframe,style='Login.TEntry',
                         textvariable=user_var)
username_ent.grid(row=2, column=2, 
                  columnspan=2, sticky='ew',padx=10)

pass_var = tk.StringVar()
passwd_label = ttk.Label(login_subframe,style='Login.TLabel',
                         text='Password')
passwd_label.grid(row=3, column=1, sticky='ew',padx=10)

password_ent = ttk.Entry(login_subframe,textvariable=pass_var,
                         style='Login.TEntry',show='*')
password_ent.grid(row=3, column=2, columnspan=2, sticky='ew',padx=10)

show_pass_btn = ttk.Checkbutton(login_subframe,text='Show Password',
                                style='Login.TCheckbutton',variable=show_password,
                                command=toggle_passwd)
show_pass_btn.grid(row=3,column=4,sticky='w',padx=10)

login_btn = ttk.Button(login_subframe,text='Sign in',
                       style='Login.TButton',command=login_admin)

login_btn.grid(row=4, column=2,
               columnspan=2, sticky='ew',
               padx=10, pady=10)

admin_dash_frame = ttk.Frame(admin_frame)
admin_dash_frame.place(relx=0,rely=0,relwidth=1,relheight=1)
grid6x6(admin_dash_frame)

admin_header = ttk.Label(admin_dash_frame,text="Admin Dashboard",style='AdminTitle.TLabel',
                         font=("Calibri", 32, "bold"),anchor="center")

admin_header.grid(
    row=0,column=1,columnspan=4,
    sticky="ew",pady=20)

donors_rec_frame = ttk.Frame(admin_frame)
recp_rec_frame = ttk.Frame(admin_frame)
blood_inv_frame = ttk.Frame(admin_frame)

donors_rec_frame.place(relx=0,rely=0,relwidth=1,relheight=1)
recp_rec_frame.place(relx=0,rely=0,relwidth=1,relheight=1)
blood_inv_frame.place(relx=0,rely=0,relwidth=1,relheight=1)

def open_admin_section(section):
    if not admin_logged_in:
        messagebox.showerror(
            "Access Denied",
            "Please log in as an administrator.")
        login_frame.tkraise()
        return

    if section == donors_rec_frame:
        load_donors()

    elif section == recp_rec_frame:
        load_recipients()

    section.tkraise()

donors_btn = ttk.Button(
    admin_dash_frame,
    text="View Donors",style='Admin.TButton',
    command=lambda: open_admin_section(donors_rec_frame))

donors_btn.grid(
    row=2,column=1,
    columnspan=2,sticky="nsew",
    padx=20,pady=20)

recipients_btn = ttk.Button(
    admin_dash_frame,
    text="View Recipients",style='Admin.TButton',
    command=lambda: open_admin_section(recp_rec_frame))

recipients_btn.grid(
    row=2,column=3,
    columnspan=2,sticky="nsew",
    padx=20,pady=20)

inventory_btn = ttk.Button(
    admin_dash_frame,
    text="Blood Inventory",style='Admin.TButton',
    command=open_blood_overview)

inventory_btn.grid(
    row=3,column=1,
    columnspan=2,sticky="nsew",
    padx=20,pady=20)

logout_btn = ttk.Button(
    admin_dash_frame,
    text="Logout",style='AdminLogout.TButton',
    command=logout_admin)

logout_btn.grid(
    row=3,column=3,
    columnspan=2,sticky="nsew",
    padx=20,pady=20)

header_donor = ttk.Frame(donors_rec_frame)
header_donor.pack(fill='x',padx=10,pady=10)
title = ttk.Label(header_donor,text='Donor Records',
                  font=('Arial',20,'bold'))
title.pack(side='left',padx=10)

back = ttk.Button(header_donor,text='Back',command=lambda: admin_dash_frame.tkraise())
back.pack(side='right',padx=10)

columns_don = ('ID','Name','Gender','Age','DOB','Phone',
           'City','Blood Group','Haemoglobin','Weight','SBP','DBP','Last Donation')

tree_don = ttk.Treeview(donors_rec_frame,columns=columns_don,
                        style='Records.Treeview',show='headings')
don_scroll = ttk.Scrollbar(
    donors_rec_frame,
    orient='horizontal',
    command=tree_don.xview)

tree_don.configure(xscrollcommand=don_scroll.set)

tree_don.pack(fill='both',expand=True)
don_scroll.pack(fill='x')

tree_don.heading('ID',text='Donor ID')
tree_don.column('ID',width=70,anchor='center')

tree_don.heading('Name',text='Donor Name')
tree_don.column('Name',width=100,anchor='center')

tree_don.heading('Gender',text='Gender')
tree_don.column('Gender',width=80,anchor='center')

tree_don.heading('Age',text='Age')
tree_don.column('Age',width=40,anchor='center')

tree_don.heading('DOB',text='DOB')
tree_don.column('DOB',width=90,anchor='center')

tree_don.heading('Phone',text='Phone')
tree_don.column('Phone',width=100,anchor='center')

tree_don.heading('City',text='City')
tree_don.column('City',width=70,anchor='center')

tree_don.heading('Blood Group',text='Blood Group')
tree_don.column('Blood Group',width=90,anchor='center')

tree_don.heading('Haemoglobin',text='Haemoglobin')
tree_don.column('Haemoglobin',width=80,anchor='center')

tree_don.heading('Weight',text='Weight')
tree_don.column('Weight',width=70,anchor='center')

tree_don.heading('SBP',text='Systolic BP')
tree_don.column('SBP',width=90,anchor='center')

tree_don.heading('DBP',text='Diastolic BP')
tree_don.column('DBP',width=90,anchor='center')

tree_don.heading('Last Donation',text='Last Donation')
tree_don.column('Last Donation',width=110,anchor='center')

donor_query = '''SELECT 
                Donor_ID,Donor_Name,Gender,
                Age,DOB,Phone,City,Blood_Group,
                Haemoglobin,Weight,Systolic_BP,
                Diastolic_BP,Last_Donation 
            FROM donors_general NATURAL JOIN donors_medical
            ORDER BY Donor_ID'''
def load_donors():
    for item in tree_don.get_children():
        tree_don.delete(item)

    cur.execute(donor_query)
    records_don = cur.fetchall()

    for rec in records_don:
        tree_don.insert('','end',values=rec)

header_recp = ttk.Frame(recp_rec_frame)
header_recp.pack(fill='x',padx=10,pady=10)
title = ttk.Label(header_recp,text='Recipient Records',
                  font=('Arial',20,'bold'))
title.pack(side='left',padx=10)

back = ttk.Button(header_recp,text='Back',command=lambda: admin_dash_frame.tkraise())
back.pack(side='right',padx=10)

columns_recp = ('ID','Name','Gender','Age','DOB','Phone',
           'Blood Group','Condition','Urgency','Units Required')

tree_recp = ttk.Treeview(recp_rec_frame,columns=columns_recp,
                        style='Records.Treeview',show='headings')

recp_scroll = ttk.Scrollbar(
    recp_rec_frame,
    orient='horizontal',
    command=tree_recp.xview)

tree_recp.configure(xscrollcommand=recp_scroll.set)

tree_recp.pack(fill='both',expand=True)
recp_scroll.pack(fill='x')

tree_recp.heading('ID',text='Recipient ID')
tree_recp.column('ID',width=70,anchor='center')

tree_recp.heading('Name',text='Recipient Name')
tree_recp.column('Name',width=100,anchor='center')

tree_recp.heading('Gender',text='Gender')
tree_recp.column('Gender',width=80,anchor='center')

tree_recp.heading('Age',text='Age')
tree_recp.column('Age',width=40,anchor='center')

tree_recp.heading('DOB',text='DOB')
tree_recp.column('DOB',width=90,anchor='center')

tree_recp.heading('Phone',text='Phone')
tree_recp.column('Phone',width=100,anchor='center')

tree_recp.heading('Blood Group',text='Blood Group')
tree_recp.column('Blood Group',width=90,anchor='center')

tree_recp.heading('Condition',text='Condition')
tree_recp.column('Condition',width=80,anchor='center')

tree_recp.heading('Urgency',text='Urgency')
tree_recp.column('Urgency',width=70,anchor='center')

tree_recp.heading('Units Required',text='Units Required')
tree_recp.column('Units Required',width=120,anchor='center')

recipients_query = '''SELECT 
                Recipient_ID,Recipient_Name,Gender,
                Age,DOB,Phone,Blood_Group,
                Rec_Condition,Urgency,Units_Reqd
            FROM recipients_general NATURAL JOIN recipients_medical
            ORDER BY Recipient_ID'''

def load_recipients():
    for item in tree_recp.get_children():
        tree_recp.delete(item)

    cur.execute(recipients_query)
    records_recp = cur.fetchall()

    for rec in records_recp:
        tree_recp.insert('','end',values=rec)

blood_inv_frame.place(
    relx=0,rely=0,
    relwidth=1,relheight=1)

inv_header = ttk.Frame(blood_inv_frame)
inv_header.pack(fill='x',padx=10,pady=5)

inv_title = ttk.Label(inv_header,text='Blood Group Overview',
                      font=('Calibri',24,'bold'))
inv_title.pack(side='left',padx=10)

inv_back_btn = ttk.Button(inv_header,text='Back',
                          command=lambda:admin_dash_frame.tkraise())
inv_back_btn.pack(side='right',padx=10)

inv_content = ttk.Frame(blood_inv_frame)
inv_content.pack(fill='both',expand=True,padx=10,pady=5)

blood_columns = ('Blood Group','Donors Registered',
                 'Recipients Registered','Units Required')

blood_tree = ttk.Treeview(
    inv_content,
    columns=blood_columns,
    show='headings',
    height=8)

for col in blood_columns:
    blood_tree.heading(col,text=col)
    blood_tree.column(col,anchor='center',width=120)

blood_tree.pack(
    side='left',fill='both',expand=True,padx=5)

compat_columns = ('Recipient Blood Group',
                  'Compatible Donor Groups')

compat_tree = ttk.Treeview(
    inv_content,
    columns=compat_columns,
    show='headings',
    height=8)

for col in compat_columns:
    compat_tree.heading(col,text=col)
    compat_tree.column(col,anchor='center',width=150)

compat_tree.pack(
    side='right',fill='both',expand=True,padx=5)


compatibility = [('A+','A+, A-, O+, O-'),('A-','A-, O-'),
                 ('B+','B+, B-, O+, O-'),('B-','B-, O-'),
                 ('AB+','All blood groups'),('O+','O+, O-'),
                 ('AB-','AB-, A-, B-, O-'),('O-','O-')]

for rec in compatibility:
    compat_tree.insert('', 'end', values=rec)

admin_dash_frame.tkraise()

root.mainloop()
